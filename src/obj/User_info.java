package obj;
public class User_info {
	private String id;    //ID，唯一
	private String user_id;    //用户ID，唯一
	private String user_name;  //用户名称
	private String pwd;        //密码
	private String user_dis;    //用户描述
	private String branch;     //所属营业部
	private String status;     //用户权限状态
	private String tp;         //用户类型
	private String del_flag;    //删除标识：0-正常，1-已删除
	private String file_right;   //归档权限：0-无权限，1-有权限
	private String down_right;   //下载权限：0-无权限，1-有权限
	/**
	 * @return the user_id
	 */
	public String getUser_id() {
		return user_id;
	}
	/**
	 * @param user_id the user_id to set
	 */
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	/**
	 * @return the user_name
	 */
	public String getUser_name() {
		return user_name;
	}
	/**
	 * @param user_name the user_name to set
	 */
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	/**
	 * @return the pwd
	 */
	public String getPwd() {
		return pwd;
	}
	/**
	 * @param pwd the pwd to set
	 */
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	/**
	 * @return the user_dis
	 */
	public String getUser_dis() {
		return user_dis;
	}
	/**
	 * @param user_dis the user_dis to set
	 */
	public void setUser_dis(String user_dis) {
		this.user_dis = user_dis;
	}
	/**
	 * @return the branch
	 */
	public String getBranch() {
		return branch;
	}
	/**
	 * @param branch the branch to set
	 */
	public void setBranch(String branch) {
		this.branch = branch;
	}
	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}
	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}
	/**
	 * @return the tp
	 */
	public String getTp() {
		return tp;
	}
	/**
	 * @param tp the tp to set
	 */
	public void setTp(String tp) {
		this.tp = tp;
	}
	/**
	 * @return the del_flag
	 */
	public String getDel_flag() {
		return del_flag;
	}
	/**
	 * @param del_flag the del_flag to set
	 */
	public void setDel_flag(String del_flag) {
		this.del_flag = del_flag;
	}
	/**
	 * @return the file_right
	 */
	public String getFile_right() {
		return file_right;
	}
	/**
	 * @param file_right the file_right to set
	 */
	public void setFile_right(String file_right) {
		this.file_right = file_right;
	}
	/**
	 * @return the down_right
	 */
	public String getDown_right() {
		return down_right;
	}
	/**
	 * @param down_right the down_right to set
	 */
	public void setDown_right(String down_right) {
		this.down_right = down_right;
	}
	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	
	
}