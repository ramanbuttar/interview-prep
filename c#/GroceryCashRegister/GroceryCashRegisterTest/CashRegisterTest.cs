using System;
using GroceryCashRegister;

namespace GroceryCashRegisterTest
{
    public static class CashRegisterTest
    {
        public static void Run()
        {
            CashRegister emptyTill = new CashRegister();
            CashRegister till1 = new CashRegister();
            CashRegister till2 = new CashRegister();

            Item unitItem = new Item("Unit Item", 3.49m);
            Item weightItem = new Item("Weight Item", 1.99m, 1.00m);
            Item unitDiscountItem = new Item("Unit Discount Item", 4.99m, 1.5m);
            Item bulkDiscountItem = new Item("Bulk Discount Item", 2.99m);

            CouponDiscount coupon = new CouponDiscount(0.01m, 1.00m);
            UnitDiscount unit = new UnitDiscount(0.10m);
            BulkDiscount bulk = new BulkDiscount(0.15m, 2, 0);

            unitDiscountItem.Discount = unit;
            bulkDiscountItem.Discount = bulk;

            //System.Console.WriteLine(emptyTill);
            if (emptyTill.Total != 0.0m) { throw new Exception("FAIL"); }
            if (emptyTill.Savings != 0.0m) { throw new Exception("FAIL"); }
            if (emptyTill.ItemCount() != 0) { throw new Exception("FAIL"); }
            if (emptyTill.CouponCount() != 0) { throw new Exception("FAIL"); }

            till1.AddItem(unitItem);
            till1.ApplySales();
            //System.Console.WriteLine(till1);
            if (till1.Total != 3.49m) { throw new Exception("FAIL"); }
            if (till1.Savings != 0.0m) { throw new Exception("FAIL"); }
            if (till1.ItemCount() != 1) { throw new Exception("FAIL"); }
            if (till1.CouponCount() != 0) { throw new Exception("FAIL"); }

            till2.AddItem(weightItem);
            till2.AddCoupon(coupon);
            till2.ApplySales();
            till2.ApplyCoupons();
            //System.Console.WriteLine(till2);
            if (till2.Total != 1.99m) { throw new Exception("FAIL"); }
            if (till2.Savings != 0.0199m) { throw new Exception("FAIL"); }
            if (till2.ItemCount() != 1) { throw new Exception("FAIL"); }
            if (till2.CouponCount() != 1) { throw new Exception("FAIL"); }
        }
    }
}