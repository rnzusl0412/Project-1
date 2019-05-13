package customer.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import customer.dao.CustomerDAO;
import customer.vo.CustomerVO;

@Service
public class CustomerBIZ implements Validator {

	@Autowired
	CustomerDAO customerDao;

	public List<CustomerVO> getAll() {

		return customerDao.getAll();
	}

	public int getDelete(String del_name) {

		return customerDao.getDelete(del_name);
	}

	public int getInsert(CustomerVO cus) {
		return customerDao.getInsert(cus);
	}

	public int getUpdate(CustomerVO cus) {
		return customerDao.getUpdate(cus);
	}

	public int getLogin(CustomerVO cus) {
		return customerDao.getLogin(cus);
	}

	public CustomerVO getCustomer(String id) {
		return customerDao.getCustomer(id);
	}
	
	public String getCustomerID(CustomerVO vo) {
		return customerDao.getCustomerID(vo);
	}
	
	public CustomerVO getCustomerPW(CustomerVO vo) {
		return customerDao.getCustomerPW(vo);
	}
	
	public int getCustomerResetPW(CustomerVO vo) {
		return customerDao.getCustomerResetPW(vo);
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return CustomerVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		CustomerVO VO = (CustomerVO) target;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "c_id", "required", "Field is required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "c_name", "required", "Field is required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "c_nic_name", "required", "Field is required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "c_email", "required", "Field is required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "c_phone", "required", "Field is required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "c_pw", "required", "Field is required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "c_birth", "required", "Field is required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "c_sex", "required", "Field is required");

		if (getCustomer(VO.getC_id()) != null) {
			errors.rejectValue("c_id","c_id", "사용중인 ID 입니다.");
		}
		
		if (getCustomer(VO.getC_email()) != null) {
			errors.rejectValue("c_email","c_email", "사용중인 E-mail 입니다.");
		}
		
	}

}
