import com.surelution.vms.User

class BootStrap {

    def init = { servletContext ->
		def user = new User(username:'admin1',enable:true,password:'1111');
		user.save(flush:true)
    }
    def destroy = {
    }
}
