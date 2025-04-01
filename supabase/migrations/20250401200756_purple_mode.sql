/*
  # Initial Schema Setup for Easter Menu

  1. New Tables
    - categories
      - id (uuid, primary key)
      - name (text)
      - created_at (timestamp)
    
    - products
      - id (uuid, primary key)
      - name (text)
      - description (text)
      - price (decimal)
      - image_url (text)
      - created_at (timestamp)
    
    - product_sizes
      - id (uuid, primary key)
      - product_id (uuid, foreign key)
      - size (text)
      - created_at (timestamp)
    
    - product_categories
      - product_id (uuid, foreign key)
      - category_id (uuid, foreign key)
      - created_at (timestamp)

  2. Security
    - Enable RLS on all tables
    - Add policies for authenticated users to manage data
    - Allow public read access for products and categories
*/

-- Create categories table
CREATE TABLE categories (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  created_at timestamptz DEFAULT now()
);

-- Create products table
CREATE TABLE products (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  description text,
  price decimal(10,2) NOT NULL,
  image_url text,
  created_at timestamptz DEFAULT now()
);

-- Create product_sizes table
CREATE TABLE product_sizes (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  product_id uuid REFERENCES products(id) ON DELETE CASCADE,
  size text NOT NULL,
  created_at timestamptz DEFAULT now()
);

-- Create product_categories table
CREATE TABLE product_categories (
  product_id uuid REFERENCES products(id) ON DELETE CASCADE,
  category_id uuid REFERENCES categories(id) ON DELETE CASCADE,
  created_at timestamptz DEFAULT now(),
  PRIMARY KEY (product_id, category_id)
);

-- Enable RLS
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE product_sizes ENABLE ROW LEVEL SECURITY;
ALTER TABLE product_categories ENABLE ROW LEVEL SECURITY;

-- Policies for public read access
CREATE POLICY "Allow public read access on categories" 
  ON categories FOR SELECT 
  TO public 
  USING (true);

CREATE POLICY "Allow public read access on products" 
  ON products FOR SELECT 
  TO public 
  USING (true);

CREATE POLICY "Allow public read access on product_sizes" 
  ON product_sizes FOR SELECT 
  TO public 
  USING (true);

CREATE POLICY "Allow public read access on product_categories" 
  ON product_categories FOR SELECT 
  TO public 
  USING (true);

-- Policies for authenticated users (admin)
CREATE POLICY "Allow authenticated users to manage categories" 
  ON categories FOR ALL 
  TO authenticated 
  USING (true) 
  WITH CHECK (true);

CREATE POLICY "Allow authenticated users to manage products" 
  ON products FOR ALL 
  TO authenticated 
  USING (true) 
  WITH CHECK (true);

CREATE POLICY "Allow authenticated users to manage product_sizes" 
  ON product_sizes FOR ALL 
  TO authenticated 
  USING (true) 
  WITH CHECK (true);

CREATE POLICY "Allow authenticated users to manage product_categories" 
  ON product_categories FOR ALL 
  TO authenticated 
  USING (true) 
  WITH CHECK (true);

-- Insert initial categories
INSERT INTO categories (name) VALUES
  ('Ovos de Páscoa'),
  ('Chocolates'),
  ('Cestas'),
  ('Doces Especiais');

-- Insert initial products with existing data
INSERT INTO products (name, description, price, image_url) VALUES
  (
    'Ovo de Páscoa Trufado',
    'Chocolate belga recheado com trufa cremosa',
    89.90,
    'https://images.unsplash.com/photo-1610450949065-1f2841536c88?auto=format&fit=crop&q=80&w=400'
  ),
  (
    'Coelho de Chocolate',
    'Chocolate ao leite decorado artesanalmente',
    45.90,
    'https://images.unsplash.com/photo-1552767059-ce182ead6c1b?auto=format&fit=crop&q=80&w=400'
  ),
  (
    'Cesta de Páscoa Premium',
    'Ovo de páscoa + bombons + brigadeiros especiais',
    159.90,
    'https://images.unsplash.com/photo-1515595967223-f9fa59af5cd3?auto=format&fit=crop&q=80&w=400'
  ),
  (
    'Mini Ovos Recheados',
    'Caixa com 12 mini ovos sortidos',
    49.90,
    'https://images.unsplash.com/photo-1616628188467-8aa0cf877a47?auto=format&fit=crop&q=80&w=400'
  );