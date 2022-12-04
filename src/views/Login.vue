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
								<h2 class="text-uppercase text-center mb-5">Log In</h2>
								<div v-if="error" class="text-bg-danger text-center mb-1">
									{{warning}}
								</div>
								<!--Form-->
								<form @submit.prevent="handleSubmit">
									<div class="form-floating mb-3">
										<input 
											type="email"
											class="form-control"
											id="floatingInput"
											placeholder="name@example.com"
											v-model="user.email"
											@focus="clearStatus"
											required>
										<label for="floatingInput">Email address</label>
									</div>

									<div class="form-floating mb-3">
										<input
										type="password"
										class="form-control"
										id="floatingPassword"
										placeholder="Password"
										v-model="user.password"
										@focus="clearStatus"
										required>
										<label for="floatingPassword">Password</label>
									</div>

									<div class="d-flex justify-content-center">
										<button type="submit"
										class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Go!</button>
									</div>

									<div class="d-flex justify-content-center">
										<a href="#">Forgot password?</a>
									</div>

									<p class="text-center text-muted mt-3 mb-0">
										Don't have an account? <router-link to="/register"><a class="fw-bold text-body"><u>Register here</u></a></router-link>
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
			email: '',
			password: '',
        },
		submitting: false,
		error: false,
		warning: '',
      }
    },
	
	methods: {
		handleSubmit: function () {
            this.submitting = true
            this.clearStatus()
  
            if (this.invalidEmail || this.invalidPassword) {
                this.error = true		
                return
            }
  
            this.loginUser(this.user)					
        },

        clearStatus: function () {
            this.error = false
        },

		async loginUser(user) {
            if ( await this.$store.dispatch('user/loginUser', user) ) {
                //login valid				
                this.$router.push('/message/5')
            }				
            else {
                //login failed				
                this.error = true
                this.submitting = false
				this.warning = "Login failed: wrong email or password"							
            }			
                          
        },

		cancel() {
            this.$router.push('/')
        },
	},
	
	computed: {
		invalidPassword: function () {
            if (this.user.password === '' ) return true
            else return false
        },		

        invalidEmail: function () {
            if (this.user.email === '' || this.user.email.search('@')===-1) return true
            else return false
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
	created: function () {
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