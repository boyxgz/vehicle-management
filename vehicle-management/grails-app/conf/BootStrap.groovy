import com.surelution.vms.RequestMap
import com.surelution.vms.User
import com.surelution.vms.Rlow
import com.surelution.vms.UserRlow;
import com.surelution.vms.KeyedMessage;

class BootStrap {

    def init = { servletContext ->
//		def user = new User(username:'admin1',enable:true,password:'1111');
//		user.save(flush:true)
		def roleAdmin = Rlow.findByAuthority("ROLE_ADMIN");
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
		if(user == null){
			user = new User(username:'admin',enable:true,password:'123456');
			user.save(flush:true)
		}else{
		}
		
		def ur = UserRlow.findByUser(user);
		if(ur == null){
			ur = UserRlow.create(user,roleUser,false);
		}
		
		def requestMap = RequestMap.list();
		println requestMap[0] == null
		if(requestMap[0] == null){
			def r1 = new RequestMap()
			r1.configAttribute = "permitAll"
			r1.url = "/login/auth"
			r1.save(flush:true)
			def r2 = new RequestMap()
			r2.url = "/jarvis/js/jQuery-2.1.4.min.js"
			r2.configAttribute = "permitAll"
			r2.save(flush:true)
			def r3 = new RequestMap()
			r3.url = "/**"
			r3.configAttribute = "ROLE_USER"
			r3.save(flush:true)
		}
		
    }
	
    def destroy = {
    }
}
