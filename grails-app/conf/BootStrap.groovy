import com.parago.pmo.AuditStatus;
import com.parago.pmo.InvoiceStatus
import com.parago.pmo.Milestone
import com.parago.pmo.Person;
import com.parago.pmo.ProjectStatus;
import com.parago.pmo.TurnoverStatus;

class BootStrap {

    def init = { servletContext ->
		
		if(!ProjectStatus.count())
		{
			new ProjectStatus(status:"Active").save(failOnError: true);
			new ProjectStatus(status:"Pending Approval").save(failOnError: true);
			new ProjectStatus(status:"On Hold").save(failOnError: true);
			new ProjectStatus(status:"90 day").save(failOnError: true);
			new ProjectStatus(status:"Complete").save(failOnError: true);
			new ProjectStatus(status:"Cancelled").save(failOnError: true);
            new ProjectStatus(status:"New").save(failOnError: true);
			
		}
		if(!AuditStatus.count())
		{
			new AuditStatus(status:"In Progress").save(failOnError: true);
			new AuditStatus(status:"N/A").save(failOnError: true);
			new AuditStatus(status:"Pending Completion").save(failOnError: true);
			new AuditStatus(status:"Complete").save(failOnError: true);
		}
		if(!InvoiceStatus.count())
		{
			new InvoiceStatus(status:"Pending Completion").save(failOnError: true);
			new InvoiceStatus(status:"Invoiced").save(failOnError: true);
			new InvoiceStatus(status:"Waived").save(failOnError: true);
			new InvoiceStatus(status:"Included in Transaction Fees").save(failOnError: true);
			new InvoiceStatus(status:"Free Hours").save(failOnError: true);
			new InvoiceStatus(status:" N/A - Corporate").save(failOnError: true);
			
		}
		if(!TurnoverStatus.count())
		{
			new TurnoverStatus(status:"Planned").save(failOnError: true);
			new TurnoverStatus(status:"Complete").save(failOnError: true);
			new TurnoverStatus(status:"In Progress").save(failOnError: true);
			new TurnoverStatus(status:"Not Applicable").save(failOnError: true);
		}
		if(!Milestone.count())
		{
			new Milestone(milestone:"Admin kick-off").save(failOnError: true);
			new Milestone(milestone:"Mid-project Audit").save(failOnError: true);
			new Milestone(milestone:"Solution Review").save(failOnError: true);
			new Milestone(milestone:"Sunset Review").save(failOnError: true);
			new Milestone(milestone:"Test Strategy Review").save(failOnError: true);
		}
		if(!Person.count())
		{
			new Person(firstName: "Neelima", lastName:"Annam", email:"neelima@parago.com").save(failOnError: true);
			new Person(firstName: "Craig", lastName:"Hammer", email:"mchammer@parago.com").save(failOnError: true);
			new Person(firstName: "Tom", lastName:"Kale", email:"tom.kale@parago.com").save(failOnError: true);
			new Person(firstName: "Peggy", lastName:"Rattarree", email:"peggy.rattarree@parago.com").save(failOnError: true);
			new Person(firstName: "Miriam", lastName:"Seasock", email:"miriam.seasock@parago.com").save(failOnError: true);
			new Person(firstName: "Amy", lastName:"Tribendis", email:"amy.tribendis@parago.com").save(failOnError: true);
			new Person(firstName: "Franz", lastName:"Zemen", email:"franz.zemen@parago.com").save(failOnError: true);
		}
		/*if(!ProjectInfo.count())
		{
			new ProjectInfo(projectName: "Project BAM",projectType: "Top Secret",projectCode: "123", startDate: new Date(), closeDate: new Date(), actualReleaseDate: new Date(), category: "test", scrumMaster: "Malcolm",    ).save(failOnError: true);
		}
		if(!Risk.count)
		{
			new Risk(risk:"Risk1", riskMigrationStrategy: "Something",projectInfo:ProjectInfo.getAll().get(0), invoiceStatus:InvoiceStatus.getAll().get(0)).save(failOnError: true);
		}*/
		
		
    }
    def destroy = {
    }
}
