const comments = {
    namespaced: true,
    state: {
        comments: [
        // {
        //"id":"1",
        //"content":"bla bla bla",
        //"user_id":"45",
        //"user_name":"John Doe",        
        //"micropost_id":"105", 
        //"created_at":"2016-10-18 12:14:51",                              
        //}
        ]
    },
    getters: {
        getComments (state) {
            return state.comments;
        },
        getPostComments: (state) => (id) => {
            const results = state.comments.filter(c => {
                return c.micropost_id == id;
              })
              return results
        },  


    }, 
    mutations: {
        addComments(state, comments){
            state.comments = comments
        },
        addComment(state, comment){
            state.comments = [...state.comments, comment]
        },
    },
    actions: {
        async getComments({commit}) {
			try {
				const response = await fetch(`http://localhost/LAB8_10/api/comments.php`)
				const data = await response.json()
                commit('addComments', data)
                return true
			} 
			catch (error) {
				console.error(error)
                return false
			}
		},
        async addComment({commit, rootGetters}, newComment) {
			try {
				const response = await fetch(`http://localhost/LAB8_10/api/comments.php?micropost_id=${newComment.post_id}&session_id=${rootGetters['user/getUser'].session_id}`, {
					method: 'POST',
					body: JSON.stringify(newComment.post),
					headers: { 'Content-type': 'application/json; charset=UTF-8' },
				})
				const data = await response.json()
                console.log(data)
                commit('addComment', data)
                return true
			} 
			catch (error) {
				console.error(error)
                return false
			}
		},

    },
    modules: {
    }
}
export default 
    comments