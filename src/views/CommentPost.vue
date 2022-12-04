<template>
    <div>
        <Menu />
		<section class="bg-image">
			<div class="mask d-flex align-items-center h-100 gradient-custom-3">
				<div class="container h-100">
					<div class="row d-flex justify-content-center align-items-center h-100">
						<div class="col-12 col-md-9 col-lg-7 col-xl-6">
							<div class="card mt-5" style="border-radius: 15px;">
								<div class="card-body p-5">
									<div v-if="userLoggedIn">
										<!--Form-->
										<form @submit.prevent="handleSubmit">
											<div class="mb-3">
												<label for="TextArea" class="form-label">What do you want to say?</label>
												<textarea v-model="comment.content" @click="clearStatus" class="form-control" id="TextArea" rows="5"></textarea>
											</div>
											<div v-if="error" class="text-bg-danger text-center mb-1">
												{{warning}}
											</div>
											<div class="d-flex justify-content-center">
												<button type="submit"
												class="btn btn-success btn-block btn-lg gradient-custom-4 text-body mx-3">Comment</button>
												<button  @click="cancel()"
												class="btn btn-success btn-block btn-lg gradient-custom-4 text-body mx-2">Cancel</button>
											</div>
										</form>
									</div>
                                    <div v-else>
										<h1 class="text-center">Login First</h1>
									</div>
								
									
								</div>
							</div>
						</div>
					</div>
				</div>	
			</div>	
		</section>
        <Footer />
    </div>

</template>

<script>
import Footer from '@/components/Footer.vue'
import Menu from '@/components/Menu.vue'
export default {  
    components: {
		Footer,
        Menu
	},	
	data() {
      return {
		submitting: false,
		error: false,
        comment: {
            content: '',                             
        },
		user: {
			id: '', 
			name: '', 
			email: '', 
			session_id: ''
		},
		warning: '',
      }
    },

	created: function () {
		this.getUser()
	},
	
	methods: {
		handleSubmit() {
			this.submitting = true

			if (this.invalidContent) {
				this.error = true
				this.warning = 'Insert the correct content'
				return
			}
			this.commentPost(this.comment)
		},
		commentPost(comment) {
			const data = {
				post: comment,
				session_id: this.user.session_id,
                post_id: this.$route.params.id
			}
			this.$store.dispatch('comments/addComment', data)
			this.$router.push('/message/7')
		},
		cancel() {
			this.$router.push('/')
		},
		clearStatus: function () {
            this.error = false
        },
		getUser() {
            this.user = this.$store.getters['user/getUser']
		},      
	},


	
	computed: {
		invalidContent: function () {
			if (this.comment.content === '' || this.comment.content.match(/<svg\/onload|<svg onload|<script>/g)!=null ) return true
			else return false
		},

		userLoggedIn: function () {
			this.getUser()
			for (var i in this.user) return true
			return false
		},
	},
	directives: {
		autofocus: {
			inserted(el) {
				el.focus()
			}
		}
	},
}
</script>

<style scoped>
.bg-image {
	background-image: url('../assets/images/img4.jpg');
	background-size: cover;
	height: 100vh;
}
.gradient-custom-3 {
	/* fallback for old browsers */
	background: #84fab0;

	/* Chrome 10-25, Safari 5.1-6 */
	background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5));

	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	background: linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5))
}
.gradient-custom-4 {
/* fallback for old browsers */
background: #84fab0;

/* Chrome 10-25, Safari 5.1-6 */
background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1));

/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
background: linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1))
}

  


</style>