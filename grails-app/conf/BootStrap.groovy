import com.parago.pmo.AuditStatus;
import com.parago.pmo.InvoiceStatus
import com.parago.pmo.Person;
import com.parago.pmo.ProjectCode;
import com.parago.pmo.ProjectType;
import com.parago.pmo.ProjectStatus

class BootStrap {

    def init = { servletContext ->
		if(!ProjectType.count())
		{
			new ProjectType(type: "Client").save(failOnError: true);
			new ProjectType(type: "New Services").save(failOnError: true);
			new ProjectType(type: "Infrastructure").save(failOnError: true);
			new ProjectType(type: "Reporting").save(failOnError: true);
			new ProjectType(type: "Corporate").save(failOnError: true);
		}
		if(!ProjectStatus.count())
		{
			new ProjectStatus(status:"Active").save(failOnError: true);
			new ProjectStatus(status:"Pending Approval").save(failOnError: true);
			new ProjectStatus(status:"On Hold").save(failOnError: true);
			new ProjectStatus(status:"90 day").save(failOnError: true);
			new ProjectStatus(status:"Complete").save(failOnError: true);
			new ProjectStatus(status:"Cancelled").save(failOnError: true);
			
		}
		if(!AuditStatus.count())
		{
			new AuditStatus(status:"In Progress").save(failOnError: true);
			new AuditStatus(status:"N/A").save(failOnError: true);
			new AuditStatus(status:"Pending Completetion").save(failOnError: true);	
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
		if(!Person.count())
		{
			new Person(firstName: "Neelima", lastName:"Annam", email:"neelima@parago.com").save(failOnError: true);
			new Person(firstName: "Craig", lastName:"Hammer", email:"mchammer@parago.com").save(failOnError: true);
		}
		if(!ProjectCode.count())
		{
			new ProjectCode(code: "123", name: "Ecode").save(failOnError: true);
			new ProjectCode(code: "456", name: "Prop").save(failOnError: true);
		}
		
    }
    def destroy = {
    }
}
