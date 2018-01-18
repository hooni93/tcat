package spring.project.tcat.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import spring.project.tcat.persistence.YMGuestDAOImpl;
@Service
public class YMGuestServiceImp implements YMGuestService {

	@Autowired
	YMGuestDAOImpl YMDao;
}
