import com.surelution.vms.User
import com.surelution.vms.Rlow
import com.surelution.vms.UserRlow;

class BootStrap {

    def init = { servletContext ->
//		def user = new User(username:'admin1',enable:true,password:'1111');
//		user.save(flush:true)
		def roleAdmin = Rlow.findByAuthority("ROLE_ADMIN");
		println roleAdmin
		if(roleAdmin == null){
			roleAdmin = new Rlow();
			roleAdmin.authority = "ROLE_ADMIN";
			roleAdmin.save(flush:true);
		}
		
		def roleUser = Rlow.findByAuthority("ROLE_USER");
		if(roleUser == null){
			roleUser = new Rlow();
			roleUser.authority = "ROLE_USER";
			roleUser.save(flush:true);
		}
		
		def user = User.findByUsername("admin");
		println user
		if(user == null){
			user = new User(username:'admin',enable:true,password:'123456');
			user.save(flush:true)
		}else{
		}
		
		def ur = UserRlow.findByUser(user);
		if(ur == null){
			ur = UserRlow.create(user,roleUser,false);
		}
    }
	
    def destroy = {
    }
}
