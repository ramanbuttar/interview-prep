using System;
using GroceryCashRegister;

namespace GroceryCashRegisterTest
{
    public static class ItemTest
    {
        public static void Run()
        {
            Item emptyItem = new Item();
            Item unitItem = new Item("Unit Item", 3.49m);
            Item weightItem = new Item("Weight Item", 1.99m, 1.00m);
            Item unitDiscountItem = new Item("Unit Discount Item", 4.99m, 1.5m);
            Item bulkDiscountItem = new Item("Bulk Discount Item", 2.99m);

            UnitDiscount unit = new UnitDiscount(0.10m);
            BulkDiscount bulk = new BulkDiscount(0.15m, 2, 0);

            unitDiscountItem.Discount = unit;
            bulkDiscountItem.Discount = bulk;

            System.Console.WriteLine(emptyItem);
            if (emptyItem.Name != string.Empty) { throw new Exception("FAIL"); }
            if (emptyItem.Price != 0.0m) { throw new Exception("FAIL"); }
            if (emptyItem.Weight != 0.0m) { throw new Exception("FAIL"); }
            if (emptyItem.Discount != null) { throw new Exception("FAIL"); }

            System.Console.WriteLine(unitItem);
            if (unitItem.Name != "Unit Item") { throw new Exception("FAIL"); }
            if (unitItem.Price != 3.49m) { throw new Exception("FAIL"); }
            if (unitItem.Weight != 0.0m) { throw new Exception("FAIL"); }
            if (unitItem.Discount != null) { throw new Exception("FAIL"); }

            System.Console.WriteLine(weightItem);
            if (weightItem.Name != "Weight Item") { throw new Exception("FAIL"); }
            if (weightItem.Price != 1.99m) { throw new Exception("FAIL"); }
            if (weightItem.Weight != 1.00m) { throw new Exception("FAIL"); }
            if (weightItem.Discount != null) { throw new Exception("FAIL"); }

            System.Console.WriteLine(unitDiscountItem);
            if (unitDiscountItem.Name != "Unit Discount Item") { throw new Exception("FAIL"); }
            if (unitDiscountItem.Price != 4.99m) { throw new Exception("FAIL"); }
            if (unitDiscountItem.Weight != 1.5m) { throw new Exception("FAIL"); }
            if (unitDiscountItem.Discount == null) { throw new Exception("FAIL"); }

            System.Console.WriteLine(bulkDiscountItem);
            if (bulkDiscountItem.Name != "Bulk Discount Item") { throw new Exception("FAIL"); }
            if (bulkDiscountItem.Price != 2.99m) { throw new Exception("FAIL"); }
            if (bulkDiscountItem.Weight != 0.0m) { throw new Exception("FAIL"); }
            if (bulkDiscountItem.Discount == null) { throw new Exception("FAIL"); }
        }
    }
}