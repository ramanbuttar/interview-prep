namespace GroceryCashRegister
{
    public class Discount
    {
        public decimal Factor { get; private set; }
        public int MinBuy { get; private set; }
        public int MaxBuy { get; private set; }
        public decimal Threshold { get; private set; }

        public Discount() : this(0.0m, 0, 0, 0.0m)
        {

        }

        public Discount(decimal _factor, int _minBuy, int _maxBuy, decimal _threshold)
        {
            this.Factor = _factor;
            this.MinBuy = _minBuy;
            this.MaxBuy = _maxBuy;
            this.Threshold = _threshold;
        }
    }

    public class CouponDiscount : Discount
    {
        public CouponDiscount() : base()
        {

        }
        public CouponDiscount(decimal _factor, decimal _threshold) : base(_factor, 0, 0, _threshold)
        {

        }

        public override string ToString()
        {
            return "Coupon discount @ " + this.Factor.ToString("P") + " after " + this.Threshold.ToString("C");
        }
    }

    public class UnitDiscount : Discount
    {
        public UnitDiscount() : base()
        {

        }

        public UnitDiscount(decimal _factor) : base(_factor, 0, 0, 0.0m)
        {

        }

        public override string ToString()
        {
            return "Unit discount @ " + this.Factor.ToString("P");
        }
    }

    public class BulkDiscount : Discount
    {
        public BulkDiscount() : base()
        {

        }

        public BulkDiscount(decimal _factor, int _minBuy, int _maxBuy) : base(_factor, _minBuy, _maxBuy, 0.0m)
        {

        }

        public override string ToString()
        {
            string desc = "Bulk discount @ " + this.Factor.ToString("P");
            if (this.MinBuy > 0)
            {
                desc += " min limit " + this.MinBuy;
            }
            if (this.MaxBuy > 0)
            {
                desc += " max limit " + this.MaxBuy;
            }
            return desc;
        }
    }
}
