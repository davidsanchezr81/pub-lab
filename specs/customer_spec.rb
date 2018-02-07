require("minitest/autorun")
require_relative("../customer")
require_relative("../drink")

class CustomerTest < MiniTest::Test

  def setup()
    @customer1 = Customer.new("Alex", 100.00)
    @customer2 = Customer.new("David" , 50.00)
    @beer = Drink.new("Deuchars IPA", 3.65)


  end

  def test_check_name_of_customer__1
    assert_equal("Alex", @customer1.name())
  end

  def test_check_name_of_customer__2
    assert_equal("David", @customer2.name())
  end


  def test_check_drinks_empty
    assert_equal(0, @customer1.drinks().count())
  end

  def test_remove_money_from_customer
    @customer1.remove_money(5.5)
    assert_equal(94.5, @customer1.wallet())
  end

  def test_add_drink_to_customer
    drinks = @customer1.add_drink(@beer)
    assert_equal(1, @customer1.drinks().count())
  end

  def test_can_customer_afford_drink__cannot_afford
    customer = Customer.new("Bert", 3.00)
    result = customer.can_customer_afford_drink(@beer)
    assert_equal(false, result)
  end

  def test_can_customer_afford_drink__can_afford
    result = @customer1.can_customer_afford_drink(@beer)
    assert_equal(true, result)
  end
end
