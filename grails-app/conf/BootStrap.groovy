
import br.com.library.security.SecUser;
import br.com.library.security.SecRole;
import br.com.library.security.SecUserSecRole;

class BootStrap {

    def init = { servletContext ->
        def userRole = SecRole.findByAuthority('ROLE_USER') ?: new SecRole(authority: 'ROLE_USER', description: 'Perfil de Usuário').save(failOnError: true); 
        def adminRole = SecRole.findByAuthority('ROLE_ADMIN') ?: new SecRole(authority: 'ROLE_ADMIN', description: 'Perfil de Administrador').save(failOnError: true); 
        def adminUser = SecUser.findByUsername('admin') ?: new SecUser(
            name: 'Administrador',
            username: 'admin',
            password: 'libraryadmin',
            owner: 'system',
            dateCreated: new Date(),
            lastUpdated: new Date(),
            enabled: true).save(failOnError: true);
        
        if (!adminUser.authorities.contains(adminRole)) {
            SecUserSecRole.create adminUser, adminRole
        }
    }
    def destroy = {
    }
}
