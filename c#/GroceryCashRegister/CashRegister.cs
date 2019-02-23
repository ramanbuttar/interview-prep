using System;
using System.Collections.Generic;
using System.Linq;

namespace GroceryCashRegister
{
    public class CashRegister
    {
        private List<Item> items;
        private readonly List<CouponDiscount> coupons;

        public decimal Total { get; private set; }
        public decimal Savings { get; private set; }

        public CashRegister()
        {
            this.items = new List<Item>();
            this.coupons = new List<CouponDiscount>();
            this.Total = 0.0m;
            this.Savings = 0.0m;
        }

        public void AddItem(Item item)
        {
            items.Add(item);
        }

        public void AddCoupon(CouponDiscount coupon)
        {
            this.coupons.Add(coupon);
        }

        public int ItemCount()
        {
            return this.items.Count();
        }

        public int CouponCount()
        {
            return this.coupons.Count();
        }

        public void ApplySales()
        {
            IEnumerable<IGrouping<string, Item>> query = this.items.GroupBy(i => i.Name);
            foreach (IGrouping<string, Item> grouping in query)
            {
                foreach (Item item in grouping)
                {
                    this.Total += item.Price;
                    if (item.Discount != null)
                    {
                        if (item.Discount.GetType() == typeof(UnitDiscount))
                        {
                            this.Savings += item.Price * item.Discount.Factor;
                        }
                        else if (item.Discount.GetType() == typeof(BulkDiscount))
                        {
                            if (item.Discount.MinBuy > 0 && grouping.Count() >= item.Discount.MinBuy)
                            {
                                this.Savings += item.Price * item.Discount.Factor;
                            }
                        }
                    }
                }
            }
        }

        public void ApplyCoupons()
        {
            decimal finalTotal = this.Total - this.Savings;
            foreach (CouponDiscount c in coupons)
            {
                if (finalTotal >= c.Threshold)
                {
                    this.Savings += finalTotal * c.Factor;
                }
            }
        }

        public override string ToString()
        {
            int padding = 50;
            List<string> description = new List<string>();
            string desc = string.Empty;

            desc = "Item(s)".PadRight(padding) + "Price ($)".PadLeft(padding);
            description.Add(desc);
            foreach (Item item in items)
            {
                desc = item.ToString();
                description.AddRange(desc.Split(new[] { "\n" }, StringSplitOptions.None).ToList());
            }
            desc = "Total".PadRight(padding) + this.Total.ToString("C").PadLeft(padding);
            description.Add(desc);
            desc = "Savings".PadRight(padding) + (this.Savings * -1.0m).ToString("C").PadLeft(padding);
            description.Add(desc);
            desc = "Final Total".PadRight(padding) + (this.Total - this.Savings).ToString("C").PadLeft(padding);
            description.Add(desc);

            int length = description.Max(i => i.Length);
            desc = new string('=', length);
            description.Insert(0, desc);
            description.Insert(2, desc);
            description.Insert(description.Count - 3, desc);
            description.Insert(description.Count - 2, desc);
            description.Insert(description.Count - 1, desc);
            description.Insert(description.Count, desc);

            return string.Join("\n", description.ToArray());
        }
    }
}