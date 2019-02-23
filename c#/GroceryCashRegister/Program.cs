namespace GroceryCashRegister
{
    public class MainClass
    {
        public static void Main()
        {
            Run();
        }

        public static void Run()
        {
            CashRegister till = new CashRegister();
            Item cereal = new Item("Cheerios", 6.99m);
            Item apples = new Item("Apples", 2.49m, 1.00m);
            Item grapes = new Item("Grapes", 3.99m, 1.5m);
            Item cookies = new Item("Oreos", 3.99m);
            Item bananas = new Item("Bananas", 1.49m, 1.5m);
            CouponDiscount coupon = new CouponDiscount(0.10m, 20.0m);
            UnitDiscount unit = new UnitDiscount(0.10m);
            BulkDiscount bulk = new BulkDiscount(0.15m, 2, 0);

            cookies.Discount = bulk;
            bananas.Discount = unit;
            till.AddItem(cereal);
            till.AddItem(apples);
            till.AddItem(grapes);
            till.AddItem(cereal);
            till.AddItem(cookies);
            till.AddItem(bananas);
            till.AddItem(cookies);
            till.AddCoupon(coupon);

            till.ApplySales();
            till.ApplyCoupons();
            System.Console.WriteLine(till);
        }
    }
}