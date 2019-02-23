namespace GroceryCashRegister
{
    enum PricePoint { Unit, Weight }

    public class Item
    {
        public string Name { get; private set; }
        public decimal Price { get; private set; }
        public decimal Weight { get; private set; }
        public Discount Discount { get; set; }
        private readonly PricePoint pricePoint;

        public Item() : this(string.Empty, 0.0m)
        {

        }

        public Item(string _name, decimal _price)
        {
            this.Name = _name;
            this.Price = _price;
            this.Weight = 0.0m;
            this.Discount = null;
            this.pricePoint = PricePoint.Unit;
        }

        public Item(string _name, decimal _price, decimal _weight) : this(_name, _price)
        {
            this.Weight = _weight;
            this.pricePoint = PricePoint.Weight;
        }

        public override string ToString()
        {
            int padding = 50;
            string desc = string.Empty;
            if (this.pricePoint == PricePoint.Weight)
            {
                desc += (this.Name + " (" + this.Weight + " lb.)").PadRight(padding, '.');
            }
            else
            {
                desc += this.Name.PadRight(padding, '.');
            }
            desc += this.Price.ToString("C").PadLeft(padding, '.');

            if (this.Discount != null)
            {
                desc += "\n\t*SALE*\t" + this.Discount.ToString();
            }
            return desc;
        }
    }
}
