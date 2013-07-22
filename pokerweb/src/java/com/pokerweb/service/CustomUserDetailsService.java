package com.pokerweb.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.log4j.Logger;
import com.pokerweb.dao.UserDAO;
import com.pokerweb.domain.DbUser;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.transaction.annotation.Transactional;


@Transactional(readOnly = true)
public class CustomUserDetailsService implements UserDetailsService {

	protected static Logger logger = Logger.getLogger("service");

	private UserDAO userDAO = new UserDAO();

        @Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException, DataAccessException {
            
		UserDetails user = null;
		try {
                    DbUser dbUser = userDAO.searchDatabase(username);
                    user =  new User(
                            dbUser.getUsername(),
                            dbUser.getPassword().toLowerCase(),
                            true,
                            true,
                            true,
                            true,
                            getAuthorities(dbUser.getAccess()) );
                     
		} catch (Exception e) {
			logger.error("Error in retrieving user");
		}
                return user;
	}
        public Collection<GrantedAuthority> getAuthorities(Integer access) {
			List<GrantedAuthority> authList = new ArrayList<GrantedAuthority>(2);
			logger.debug("Grant ROLE_USER to this user");
			authList.add(new SimpleGrantedAuthority("ROLE_USER"));
                        if ( access.compareTo(2) == 0)
                            authList.add(new SimpleGrantedAuthority("ROLE_MANAGER"));
			if ( access.compareTo(1) == 0)
                            authList.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
			return authList;
	  }
}
