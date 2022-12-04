<template>
    <div>
		<!--Navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark p-3 fixed-top">
            <div class="container-fluid">
				<router-link to="/"><a class="navbar-brand brand">AE</a></router-link>
				

				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
             
				<div class=" collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav ms-auto ">
						<li class="nav-item">
							<router-link to="/">
								<a class="nav-link mx-2 active" aria-current="page">Home</a>
							</router-link>
														
						</li>
						<li class="nav-item">
							<router-link v-if="userLoggedIn" to="/post">
								<a  class="nav-link mx-2">Post</a>
							</router-link>
							<router-link v-else to="/register">
								<a  class="nav-link mx-2" href="">Register</a>
							</router-link>
							
							
						</li>
						
						<li class="nav-item">
							<router-link v-if="userLoggedIn" to="/logout">
								<a class="nav-link mx-2 ">Logout</a>
							</router-link>
							<router-link v-else to="/login">
								<a class="nav-link mx-2 ">Login</a>
							</router-link>
						</li>
						<li class="nav-item">
							<a class="nav-link mx-2 ">Welcome {{ user.name }}</a>
						</li>	
					</ul>
				</div>
            </div>
        </nav>
    </div>

</template>

<script>
export default {
	data() {
		return {
			user: {
				id: '', 
				name: '', 
				email: '', 
				session_id: ''
			},
		}
	},
	mounted() {

	},
    methods: {
		getUser() {
            this.user = this.$store.getters['user/getUser']
		},
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
	a{
		text-decoration: none;
	}
</style>
