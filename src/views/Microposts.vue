<template >
	<div>
		<Menu />	
		<!-- Carousel -->
        <div id="demo" class="carousel slide" data-bs-ride="carousel">

            <!-- Indicators/dots -->
            <div class="carousel-indicators mx-auto" >
				<button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
				<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
				<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
            </div>
            
            <!-- The slideshow/carousel -->
            <div class="carousel-inner">
				<div class="carousel-item active">
					<img src="../assets/images/img1.jpg" alt="" class="d-block" style="width:100%">
				</div>
				<div class="carousel-item">
					<img src="../assets/images/img4.jpg" alt="" class="d-block" style="width:100%">
				</div>
				<div class="carousel-item">
					<img src="../assets/images/img3.jpg" alt="" class="d-block" style="width:100%">
				</div>
            </div>
            
            <!-- Left and right controls/icons -->
            <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
				<span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
				<span class="carousel-control-next-icon"></span>
            </button>
        </div>

		<!--<div v-if="!userLoggedIn" >
			<p class="text-center text-muted mt-3 mb-0">
				To see what tour friends are up to, <router-link to="/login"><a class="fw-bold text-body"><u>Login</u></a></router-link>
			</p>
		</div>-->
		
			<!-- BEGIN MICROPOSTS -->
			<div v-for="post in microposts" :key="post.id" class="container">

				<div class="container contains-post">
	
					<div class="card mb-3" >
						<div class="row g-0">
							<div class="col-sm-2">
								<div class="card m-2">
									<div class="card-header fw-bold">
										{{post.name}}
									</div>
									<div class="card-body">
										<p class="card-text">Updated:{{post.updated_at}}</p>
										<p class="card-text">Created:{{post.created_at}}</p>
										<a v-if="userLoggedIn && post.user_id == user.id">
											<router-link :to="'/updatePost/'+post.id"><span class="glyphicon glyphicon-pencil"></span>Update Post</router-link>
										</a>
										<a v-else-if="userLoggedIn">
											<router-link :to="'/commentPost/'+post.id"><span class="glyphicon glyphicon-pencil"></span>Comment</router-link>
										</a>
									</div>
									
								</div>
								
							</div>
							<div class="col-sm-10">
								<div class="card-body">
									<div class="card-text" v-html="post.content"></div>
									<button v-if="clickId != post.id" class="btn gradient-custom-4 my-3" @click="getPostComments(post.id)">
										<span  class="glyphicon glyphicon-pencil">Show Comments</span>
									</button>
									<div v-else class="my-3 border-top">

									</div>
									<div v-for="comment in show" :key="comment.id" class="container mb-3">
										<div v-if="comment.micropost_id == post.id" class="card">
											<div class="card-header">
												<span class="fw-bold">{{comment.user_name}}</span> commented on {{comment.created_at}}
											</div>
											<div class="card-body" v-html="comment.content">
												
											</div>
										</div>	
									</div>
									<p v-if="clickId == post.id">{{warning}}</p>
								</div>
							</div>
						</div>
					</div>
	
				</div>
			</div>
		<!-- END MICROPOSTS -->
		
		

		<Footer />

	</div>
</template>

<script>
import Footer from '@/components/Footer.vue'
import Menu from '@/components/Menu.vue'

export default {
	components: {
        Menu,
		Footer,
	},
	data() {
		return {
			microposts: [],
			comments: [],
			user: {
				id: '', 
				name: '', 
				email: '', 
				session_id: ''
			},
			show: [],
			warning: '',
			clickId: '',
		}
	},
	mounted() {
		this.getPosts()
		this.getComments()
		
	},

	methods: {
		async getPosts(){
			if(await this.$store.dispatch('microposts/getMicroposts')){
				this.microposts = this.$store.getters[('microposts/getMicroposts')]
			}
		},
		async getComments(){
			if(await this.$store.dispatch('comments/getComments')){
				this.comments = this.$store.getters[('comments/getComments')]
			}
		},
		getPostComments(id){
			this.show = this.$store.getters[('comments/getPostComments')] (id) 
			this.clickId = id
			if(this.show.length == 0)
				this.warning = 'No comments'
			else this.warning = ''
		},
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
	.carousel {
		margin-top: 2rem;
	}
	.carousel-inner {
		max-height: 700px;
		position: relative;
		margin: auto;
	}
	.contains-post{
		margin-top: 2%;
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