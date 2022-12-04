<template>
	<div>
		<section class="bg-image">
			<div class="mask d-flex align-items-center h-100 gradient-custom-3">
				<div class="container h-100">
					<div class="row d-flex justify-content-center align-items-center h-100">
						<div class="col-12 col-md-9 col-lg-7 col-xl-6">
							<div class="card mt-5" style="border-radius: 15px;">
								<div class="card-body p-5">
									<h3 class="text-center mb-5 ">Do you want to Log Out?</h3>
									<div class="d-flex justify-content-center">
										<button @click="logout()"
										class="btn btn-success btn-block btn-lg gradient-custom-4 text-body mx-2">Logout</button>
										<button @click="cancel()"
										class="btn btn-success btn-block btn-lg gradient-custom-4 text-body mx-2">Cancel</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</template>

<script>
export default {

	data() {
		return {
			success: false,
			user: {},
		}
	},


	methods: {
		logout: function() {

			this.success = true

			if (this.userLoggedIn) {			
				// destroy session
				this.logoutUser(this.user.session_id)
			} else {
				// No user is signed in.
				this.$router.push('/')
			}

		},

		async logoutUser(session_id) {
			if ( await this.$store.dispatch('user/logoutUser', session_id) ) {
				
                this.$router.push('/message/6')
			}
		},

		cancel: function(){
			this.$router.push('/')
		},

		getUser() {
            this.user = this.$store.getters['user/getUser']
		},
	},
   
	created: function () {
		if (this.userLoggedIn) {
			// User is signed in
			this.success = false
		} else {
			// No user is signed in.
			this.success = true		
		}
	},
	
	computed: {
		userLoggedIn: function () {
			this.getUser()
			for (var i in this.user) return true
			return false
		},
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