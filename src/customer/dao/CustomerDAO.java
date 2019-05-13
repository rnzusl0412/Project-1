package customer.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;

import customer.vo.CustomerVO;

@Repository
public class CustomerDAO {

	static SqlSessionFactory factory;
	static {
		String resource = "customer/conf/mybatis-config.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			factory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}// static end

	public List<CustomerVO> getAll() {

		SqlSession session = factory.openSession();
		List<CustomerVO> all = null;
		try {
			all = session.selectList("customerMapper.CustomerAll");
		} finally {
			session.close();
		}
		return all;
	}

	// insert
	public int getInsert(CustomerVO cus) {
		SqlSession session = factory.openSession();
		int all = 0;
		System.out.println(cus);
		try {
			all = session.insert("customerMapper.CustomerInsert", cus);
			if (all > 0)
				session.commit();
		} catch (Exception e) {
			session.rollback();
		} finally {
			session.close();
		}
		return all;

	}

	// delete
	public int getDelete(String id) {
		SqlSession session = factory.openSession();
		int all = 0;
		try {
			all = session.delete("customerMapper.CustomerDelete", id);
			if (all > 0)
				session.commit();
		} catch (Exception e) {
			session.rollback();
		} finally {
			session.close();
		}
		return all;

	}

	// update

	public int getUpdate(CustomerVO pro) {
		SqlSession session = factory.openSession();
		int all = 0;
		try {
			if (pro.getC_pw() != null)
				all = session.update("customerMapper.CustomerUpdatePw", pro);
			if (pro.getC_nic_name() != null)
				all = session.update("customerMapper.CustomerUpdateNic", pro);
			if (pro.getC_email() != null)
				all = session.update("customerMapper.CustomerUpdateEmail", pro);
			if (pro.getC_phone() != null)
				all = session.update("customerMapper.CustomerUpdatePhone", pro);

			if (all > 0)
				session.commit();
		} catch (Exception e) {
			session.rollback();
		} finally {
			session.close();
		}
		return all;

	}

	public int getLogin(CustomerVO Vo) {

		SqlSession session = factory.openSession();
		CustomerVO VO = null;
		int res = 1;
		try {
			VO = session.selectOne("customerMapper.CustomerLoginCheck", Vo);
			if (VO != null) {
				VO = session.selectOne("customerMapper.CustomerLogin", Vo);
				if (VO != null) {
					res = 0;
				} else
					res = 2;
			}

		} finally {
			session.close();
		}
		return res;
	}

	// getCustomer
	public CustomerVO getCustomer(String id) {

		SqlSession session = factory.openSession();
		CustomerVO VO = null;
		try {
			VO = session.selectOne("customerMapper.CustomerSelect", id);
		} finally {
			session.close();
		}
		return VO;
	}

	public String getCustomerID(CustomerVO vo) {

		SqlSession session = factory.openSession();
		String id = null;
		try {
			CustomerVO VO = session.selectOne("customerMapper.CustomerSelectID", vo);
			if (VO != null)
				id = VO.getC_id();
		} finally {
			session.close();
		}
		return id;
	}

	public CustomerVO getCustomerPW(CustomerVO vo) {

		SqlSession session = factory.openSession();
		CustomerVO VO = null;
		try {
			VO = session.selectOne("customerMapper.CustomerSelectPW", vo);
		} finally {
			session.close();
		}
		return VO;
	}

	public int getCustomerResetPW(CustomerVO vo) {

		SqlSession session = factory.openSession();
		int r = 0;
		try {
			r = session.update("customerMapper.CustomerUpdatePw", vo);
			if (r > 0)
				session.commit();
		} catch (Exception e) {
			session.rollback();
		} finally {
			session.close();
		}
		return r;
	}

}
