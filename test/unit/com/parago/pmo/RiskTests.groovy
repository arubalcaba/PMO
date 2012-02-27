package com.parago.pmo
import com.parago.pmo.Person;
import com.parago.pmo.ProjectInfo;



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Risk)
class RiskTests {
	
	
	void testInsert(){
		def person = new Person(firstName: "Neelima", lastName:"Annam", email:"neelima@parago.com");
		person.save();
		new ProjectInfo(projectName: "Project BAM",projectType: "Top Secret",projectCode: "123",deliveryManager: Person.getAll().get(0)).save(failOnError: true);
		new Risk(risk: "Test Risk", riskMigrationStragety: "Migration Test", projectInfo: ProjectInfo.getAll().get(0)).save(failOnError: true);
		def risk = Risk.getAll().get(0);
		assertNotNull(risk);
	}

}
