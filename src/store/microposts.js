const microposts = {
    namespaced: true,
    state: {
        microposts: [
        // {
        //"id":"1",
        //"content":"bla bla bla",
        //"user_id":"45",        
        //"author":"John Smith", 
        //"created_at":"2016-10-18 12:14:51",   
        //"updated_at":"2016-10-18 12:14:51", 
        //"likes":"23",                             
        //}
        ]
    },
    getters: {
        getMicroposts (state) {
            return state.microposts;
        },
        getMicropost: (state) => (id) => {
            let index = state.microposts.findIndex(mp => mp.id == id)
            return state.microposts[index]
        },  
    }, 
    mutations: {
        addMicroposts(state, microposts){
            state.microposts = microposts
        },
        addMicropost(state, micropost){
            state.microposts = [...state.microposts, micropost]
        },
        updateMicropost(state, data){
            state.microposts = state.microposts.map(micropost => (micropost.id === data.id ? data : micropost))
        },
        deleteMicropost(state, idToRemove){
            state.microposts.forEach( function () {       
                state.microposts = state.microposts.filter(function(micropost) {
                  return micropost.id !== idToRemove
                })
            })
        },
        deleteMicroposts(state){
            state.microposts = []
        }, 
    },
    actions: {
        async getMicroposts({commit}) {
			try {
				const response = await fetch(`http://localhost/LAB8_10/api/microposts.php`)
				const data = await response.json()
                commit('addMicroposts', data)
                return true
			} 
			catch (error) {
				console.error(error)
                return false
			}
		},
        async addMicropost({commit, rootGetters}, post) {
			try {
				const response = await fetch(`http://localhost/LAB8_10/api/microposts.php?session_id=${rootGetters['user/getUser'].session_id}`, {
					method: 'POST',
					body: JSON.stringify(post),
					headers: { 'Content-type': 'application/json; charset=UTF-8' },
				})
				const data = await response.json()
                console.log(data)
                commit('addMicropost', data)
                return true
			} 
			catch (error) {
				console.error(error)
                return false
			}
		},
        async updateMicropost({commit, rootGetters}, post) {
			try {
				const response = await fetch(`http://localhost/LAB8_10/api/microposts.php?micropost_id=${post.id}&session_id=${rootGetters['user/getUser'].session_id}`, {
					method: 'PUT',
					body: JSON.stringify(post),
                    headers: { 'Content-type': 'application/json; charset=UTF-8' },
				})
				const data = await response.json()
                console.log(data)
                commit('updateMicropost', data)
                return true
			} 
			catch (error) {
				console.error(error)
                return false
			}
		},
		async deleteMicropost({commit, rootGetters},id) {
			try {
				await fetch(`http://localhost/LAB8_10/api/microposts.php?micropost_id=${id}&session_id=${rootGetters['user/getUser'].session_id}`, {
					method: 'DELETE',                
				})
				commit('deleteMicropost', id)
				return true
			} 
			catch (error) {
				console.error(error);
                return false
			}
		},

    },
    modules: {
    }
}
export default 
    microposts
