using NUnit.Framework;
using CalcLibrary;

namespace CalcLibrary.Tests
{
    [TestFixture]
    public class CalculatorTests
    {
        Calculator calc;

        [SetUp]
        public void Init()
        {
            calc = new Calculator();
        }

        [TearDown]
        public void Cleanup()
        {
            calc = null;
        }

        [TestCase(5, 10, 15)]
        [TestCase(20, 30, 50)]
        [TestCase(-5, 10, 5)]
        [TestCase(0, 0, 0)]
        public void Add_Test(int a, int b, int expected)
        {
            int actual = calc.Add(a, b);

            Assert.That(actual, Is.EqualTo(expected));
        }
    }
}