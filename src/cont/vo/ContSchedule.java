package cont.vo;

public class ContSchedule {
	private String Name;
	private String ProjectName;
	private String Color;
	private String startDate;
	private String endDate;
	private String startTime;
	private String endTime;

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getProjectName() {
		return ProjectName;
	}

	public void setProjectName(String projectName) {
		ProjectName = projectName;
	}

	public String getColor() {
		return Color;
	}

	public void setColor(String color) {
		Color = color;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public ContSchedule() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ContSchedule(String name, String projectName, String color, String startDate, String endDate,
			String startTime, String endTime) {
		super();
		Name = name;
		ProjectName = projectName;
		Color = color;
		this.startDate = startDate;
		this.endDate = endDate;
		this.startTime = startTime;
		this.endTime = endTime;
	}

}
