<template>
<div>
		
	<Menu />
	<section class="bg-image">
		<div class="mask d-flex align-items-center h-100 gradient-custom-3">
			<div class="container h-100">
				<div class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-12 col-md-9 col-lg-7 col-xl-6">
						<div class="card mt-5" style="border-radius: 15px;">
							<div v-if="!userLoggedIn" class="card-body p-5">
								<h2 class="text-uppercase text-center mb-3">Create an account</h2>
								
									<div v-if="error" class="text-bg-danger text-center mb-1">
										{{warning}}
									</div>
								

									<!--Form-->
									<form @submit.prevent="handleSubmit">

										<div class="form-floating mb-3">
											<input 
											type="text"
											class="form-control"
											placeholder="Username" 
											id="name"
											v-model="user.name"
											v-autofocus
											@focus="clearStatus"
											@keypress="clearStatus"
											required>
											<label for="name">Username</label>	
										</div>
										

										<div class="form-floating mb-3">
											<input 
											type="email" 
											class="form-control" 
											v-model="user.email"
											@focus="clearStatus"
											placeholder="name@example.com"
											id="email"
											required>
											<label for="email">Email address</label>
										</div>

										<div class="form-floating mb-3">
											<input 
											type="password" 
											class="form-control" 
											v-model="user.password"
											@focus="clearStatus"
											placeholder="Password"
											id="pwrd"
											required>
											<label for="pwrd">Password</label>
										</div>

										<div class="form-floating mb-3">
											<input 
											type="password" 
											class="form-control"
											v-model="passwordConfirmation"
											@focus="clearStatus" 
											id="c_pwrd" 
											placeholder="Password" 
											required>
											<label for="c_pwrd">Confirm Password</label>
										</div>

										<div class="d-flex justify-content-center">
											<button type="submit"
											class="btn btn-success btn-block btn-lg gradient-custom-4 text-body mx-2">
												Register
											</button>
											<button @click="cancel()" 
											class="btn btn-success btn-block btn-lg gradient-custom-4 text-body mx-2">
												Cancel
											</button>
										</div>
										

										<p class="text-center text-muted mt-5 mb-0">Have already an account? 
											<router-link to="/login"><a class="fw-bold text-body"><u>Login here</u></a></router-link>
										</p>

									</form>

							</div>
							<div v-else class="card-body p-5">
								<h1 class="text-center">Logout first</h1>
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
import Menu from '@/components/MenuTwo.vue'

export default {
	components: {
		Footer,
        Menu
	},
	data() {
      return {	
        user: {
			name: '',
			email: '',
			password: '',
        },
		passwordConfirmation: '',
		submitting: false,
		error: false,
		warning: '',	
      }
    },
	
	methods: {
		handleSubmit: function () {
			this.submitting = true	
			this.clearStatus()

			if (this.invalidName) {
				this.warning = "Your username can't include digits"
				this.error = true				
				return
			}
			else if(this.invalidEmail){
				this.warning = "Please enter a valid email"
				this.error = true				
				return
			}
			else if(this.invalidPassword){
				this.warning = "Your password must have at least 6 characters"
				this.error = true				
				return
			}
			else if(this.invalidRepeatPassword){
				this.warning = "Passwords don't match"
				this.error = true				
				return
			}
			
			// check if user exists
			this.userExists(this.user)		
  
        },
        clearStatus: function () {
            this.error = false
        },
		async userExists(user) {
			if ( await this.$store.dispatch('user/userExists', user) )	{
				this.error = true
				this.submitting = false							
				return	
			}
			else {
				// add user
				this.addUser()				
			}
        },
		async addUser() {
			if ( await this.$store.dispatch('user/addUser') ) {
				//success: new user registered
				this.$router.push('/message/4')
			}
			else {
				this.error = true
				this.submitting = false							
				return	
			}						

		},		
		cancel() {
			this.$router.push('/')
		},
	},
	
	computed: {
		invalidName: function () {
			if (this.user.name.match(/[0-9]/g)!=null )
				return true
			
			else return false
		},

		invalidPassword: function () {
			if (this.user.password.length < 6  )
				return true
			
			else return false
		},
		
		invalidRepeatPassword: function () {
			if (this.submitting && this.user.password !== this.passwordConfirmation )
				return true
				
			else 
				return false
		},	

		invalidEmail: function ()  {
			const regExpr = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/
			if (!this.user.email.match(regExpr))
				return true
			
			else
				return false
		},

		userLoggedIn: function () {
			let user = this.$store.getters['user/getUser']
			for (var i in user) return true
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
	created: function() {
		this.submitting = false
        this.error = false
	}
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