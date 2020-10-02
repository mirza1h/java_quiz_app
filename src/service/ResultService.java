package service;

import java.util.List;

import database.ResultDao;
import domain.Result;

public class ResultService {

	private ResultDao resultDao = new ResultDao();

	public ResultService(ResultDao resultDao) {
		super();
		this.resultDao = resultDao;
	}
	
	public List<Result> findAll(){
		return resultDao.findAll();
	}
	
	public List<Result> findByUsername(String username){
		return resultDao.findByUsername(username);
	}
	
	public void create(Result result){
		resultDao.save(result);
	}
	
}
