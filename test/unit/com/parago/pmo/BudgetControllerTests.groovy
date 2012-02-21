package com.parago.pmo



import org.junit.*
import grails.test.mixin.*

@TestFor(BudgetController)
@Mock(Budget)
class BudgetControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/budget/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.budgetInstanceList.size() == 0
        assert model.budgetInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.budgetInstance != null
    }

    void testSave() {
        controller.save()

        assert model.budgetInstance != null
        assert view == '/budget/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/budget/show/1'
        assert controller.flash.message != null
        assert Budget.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/budget/list'


        populateValidParams(params)
        def budget = new Budget(params)

        assert budget.save() != null

        params.id = budget.id

        def model = controller.show()

        assert model.budgetInstance == budget
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/budget/list'


        populateValidParams(params)
        def budget = new Budget(params)

        assert budget.save() != null

        params.id = budget.id

        def model = controller.edit()

        assert model.budgetInstance == budget
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/budget/list'

        response.reset()


        populateValidParams(params)
        def budget = new Budget(params)

        assert budget.save() != null

        // test invalid parameters in update
        params.id = budget.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/budget/edit"
        assert model.budgetInstance != null

        budget.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/budget/show/$budget.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        budget.clearErrors()

        populateValidParams(params)
        params.id = budget.id
        params.version = -1
        controller.update()

        assert view == "/budget/edit"
        assert model.budgetInstance != null
        assert model.budgetInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/budget/list'

        response.reset()

        populateValidParams(params)
        def budget = new Budget(params)

        assert budget.save() != null
        assert Budget.count() == 1

        params.id = budget.id

        controller.delete()

        assert Budget.count() == 0
        assert Budget.get(budget.id) == null
        assert response.redirectedUrl == '/budget/list'
    }
}
