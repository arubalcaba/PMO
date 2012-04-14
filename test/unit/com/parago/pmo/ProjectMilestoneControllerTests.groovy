package com.parago.pmo



import org.junit.*
import grails.test.mixin.*

@TestFor(ProjectMilestoneController)
@Mock(ProjectMilestone)
class ProjectMilestoneControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/projectMilestone/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.projectMilestoneInstanceList.size() == 0
        assert model.projectMilestoneInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.projectMilestoneInstance != null
    }

    void testSave() {
        controller.save()

        assert model.projectMilestoneInstance != null
        assert view == '/projectMilestone/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/projectMilestone/show/1'
        assert controller.flash.message != null
        assert ProjectMilestone.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/projectMilestone/list'


        populateValidParams(params)
        def projectMilestone = new ProjectMilestone(params)

        assert projectMilestone.save() != null

        params.id = projectMilestone.id

        def model = controller.show()

        assert model.projectMilestoneInstance == projectMilestone
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/projectMilestone/list'


        populateValidParams(params)
        def projectMilestone = new ProjectMilestone(params)

        assert projectMilestone.save() != null

        params.id = projectMilestone.id

        def model = controller.edit()

        assert model.projectMilestoneInstance == projectMilestone
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/projectMilestone/list'

        response.reset()


        populateValidParams(params)
        def projectMilestone = new ProjectMilestone(params)

        assert projectMilestone.save() != null

        // test invalid parameters in update
        params.id = projectMilestone.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/projectMilestone/edit"
        assert model.projectMilestoneInstance != null

        projectMilestone.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/projectMilestone/show/$projectMilestone.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        projectMilestone.clearErrors()

        populateValidParams(params)
        params.id = projectMilestone.id
        params.version = -1
        controller.update()

        assert view == "/projectMilestone/edit"
        assert model.projectMilestoneInstance != null
        assert model.projectMilestoneInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/projectMilestone/list'

        response.reset()

        populateValidParams(params)
        def projectMilestone = new ProjectMilestone(params)

        assert projectMilestone.save() != null
        assert ProjectMilestone.count() == 1

        params.id = projectMilestone.id

        controller.delete()

        assert ProjectMilestone.count() == 0
        assert ProjectMilestone.get(projectMilestone.id) == null
        assert response.redirectedUrl == '/projectMilestone/list'
    }
}
