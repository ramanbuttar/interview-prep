using System;
using GroceryCashRegister;

namespace GroceryCashRegisterTest
{
    public static class DiscountTest
    {
        public static void Run()
        {
            Discount emptyDiscount = new Discount();
            CouponDiscount emptyCoupon = new CouponDiscount();
            UnitDiscount emptyUnit = new UnitDiscount();
            BulkDiscount emptyBulk = new BulkDiscount();
            CouponDiscount coupon = new CouponDiscount(0.10m, 20.0m);
            UnitDiscount unit = new UnitDiscount(0.10m);
            BulkDiscount bulk = new BulkDiscount(0.15m, 2, 0);

            System.Console.WriteLine(emptyDiscount);
            if (emptyDiscount.Factor != 0.0m) { throw new Exception("FAIL"); }
            if (emptyDiscount.MinBuy != 0) { throw new Exception("FAIL"); }
            if (emptyDiscount.MaxBuy != 0) { throw new Exception("FAIL"); }
            if (emptyDiscount.Threshold != 0.0m) { throw new Exception("FAIL"); }

            System.Console.WriteLine(emptyCoupon);
            if (emptyCoupon.Factor != 0.0m) { throw new Exception("FAIL"); }
            if (emptyCoupon.MinBuy != 0) { throw new Exception("FAIL"); }
            if (emptyCoupon.MaxBuy != 0) { throw new Exception("FAIL"); }
            if (emptyCoupon.Threshold != 0.0m) { throw new Exception("FAIL"); }

            System.Console.WriteLine(emptyUnit);
            if (emptyUnit.Factor != 0.0m) { throw new Exception("FAIL"); }
            if (emptyUnit.MinBuy != 0) { throw new Exception("FAIL"); }
            if (emptyUnit.MaxBuy != 0) { throw new Exception("FAIL"); }
            if (emptyUnit.Threshold != 0.0m) { throw new Exception("FAIL"); }

            System.Console.WriteLine(emptyBulk);
            if (emptyBulk.Factor != 0.0m) { throw new Exception("FAIL"); }
            if (emptyBulk.MinBuy != 0) { throw new Exception("FAIL"); }
            if (emptyBulk.MaxBuy != 0) { throw new Exception("FAIL"); }
            if (emptyBulk.Threshold != 0.0m) { throw new Exception("FAIL"); }

            System.Console.WriteLine(coupon);
            if (coupon.Factor != 0.10m) { throw new Exception("FAIL"); }
            if (coupon.MinBuy != 0) { throw new Exception("FAIL"); }
            if (coupon.MaxBuy != 0) { throw new Exception("FAIL"); }
            if (coupon.Threshold != 20.0m) { throw new Exception("FAIL"); }

            System.Console.WriteLine(unit);
            if (unit.Factor != 0.10m) { throw new Exception("FAIL"); }
            if (unit.MinBuy != 0) { throw new Exception("FAIL"); }
            if (unit.MaxBuy != 0) { throw new Exception("FAIL"); }
            if (unit.Threshold != 0.0m) { throw new Exception("FAIL"); }

            System.Console.WriteLine(bulk);
            if (bulk.Factor != 0.15m) { throw new Exception("FAIL"); }
            if (bulk.MinBuy != 2) { throw new Exception("FAIL"); }
            if (bulk.MaxBuy != 0) { throw new Exception("FAIL"); }
            if (bulk.Threshold != 0.0m) { throw new Exception("FAIL"); }
        }
    }
}