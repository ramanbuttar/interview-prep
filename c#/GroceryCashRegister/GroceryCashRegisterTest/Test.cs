using NUnit.Framework;
namespace GroceryCashRegisterTest
{
    [TestFixture()]
    public class Test
    {
        [Test()]
        public void TestCase()
        {
            DiscountTest.Run();
            ItemTest.Run();
            CashRegisterTest.Run();
        }
    }
}
