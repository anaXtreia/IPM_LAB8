<template>
	<section class="bg-image">
        <div class="mask d-flex align-items-center h-100 gradient-custom-3">
            <div class="container h-100">
				<div class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-12 col-md-9 col-lg-7 col-xl-6">
						<div class="card mt-5" style="border-radius: 15px;">
							<div class="card-body p-5">
								<h1 class="text-center">{{message}}</h1>
							</div>
						</div>
					</div>
				</div>
			</div>
        </div>
    </section>
</template>

<script>
export default {
    data() {
        return {
            message: ''
        }
	},
	mounted() {
		this.setMessage()
	},


	methods: {
        setMessage() {
				if (this.$route.params.id == 1) {
                this.message = "Success: Post updated"
                } 
				if (this.$route.params.id == 2) {
                this.message = "Success: User deleted"
                }
				if (this.$route.params.id == 3) {
                this.message = "Success: Post added to database"
                }
				if (this.$route.params.id == 4) {
                this.message = "Welcome! You can now login"
                }
				if (this.$route.params.id == 5) {
                this.message = "Welcome back " + this.$store.getters['user/getUser'].name + "!"
                }
				if (this.$route.params.id == 6) {
                this.message = "Bye, come back soon!"
                }	
				if (this.$route.params.id == 7) {
                this.message = "Success: Comment added to database"
                }																
				
				var timeleft = 2;
				var downloadTimer = setInterval(() => {
					if(timeleft <= 0){
						clearInterval(downloadTimer)
						this.$router.push('/')
					}
				timeleft -= 1
				}, 1000)
		},


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

	.logout {
	margin: 0 auto;
	max-width: 800px;
	}

	.success-message {
	color: #32a95d;
	}

	.error-message {
	color: #d33c40;
	}

</style>