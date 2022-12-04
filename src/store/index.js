import Vue from 'vue'
import Vuex from 'vuex'
import microposts from './microposts'
import user from './user'
import comments from './comments'


Vue.use(Vuex)

export default new Vuex.Store({
  modules: {    
    microposts,
    user,
    comments,
  }
})
