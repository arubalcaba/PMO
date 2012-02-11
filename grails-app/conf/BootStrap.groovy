import com.parago.pmo.Person;
import com.parago.pmo.ProjectCode;
import com.parago.pmo.ProjectType;
import com.parago.pmo.Status

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
		if(!Status.count())
		{
			new Status(status:"Active").save(failOnError: true);
			new Status(status:"Pending Approval").save(failOnError: true);
			new Status(status:"On Hold").save(failOnError: true);
			new Status(status:"90 day").save(failOnError: true);
			new Status(status:"Complete").save(failOnError: true);
			new Status(status:"Cancelled").save(failOnError: true);
			
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
