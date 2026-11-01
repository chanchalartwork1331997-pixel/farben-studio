-- FARBEN STUDIO LIVE ADMIN
-- Run this once in Supabase SQL Editor.

create extension if not exists pgcrypto;

create table if not exists public.products (
  id bigint primary key,
  name text not null,
  description text not null default '',
  price numeric(12,2),
  category text not null default 'Scented Candles',
  image_url text,
  wholesale text not null default '',
  cost numeric(12,2),
  active boolean not null default true,
  stock integer,
  sort_order integer not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.site_settings (
  id integer primary key default 1 check (id = 1),
  brand_name text not null default 'FARBEN STUDIO',
  announcement text not null default 'HANDCRAFTED IN JAIPUR · INDIA + INTERNATIONAL SHIPPING',
  hero_kicker text not null default 'HANDMADE · SCENTED · DECORATIVE',
  hero_title text not null default 'Little pieces of warmth.',
  hero_text text not null default 'Handcrafted candles and decorative pieces made in Jaipur, bringing colour, fragrance and Pink City charm to everyday spaces and gifting moments.',
  story_title text not null default 'Crafted in Pink City.',
  story_text text not null default 'FARBEN STUDIO creates handcrafted candles and decorative pieces from Jaipur. Our collection blends modern presentation with traditional Indian warmth, designed for gifting, celebrations and beautiful everyday corners.',
  theme text not null default 'classic',
  theme_mode text not null default 'manual',
  accent text not null default '#a75d70',
  ink text not null default '#2d2523',
  bg text not null default '#f8f2ee',
  card text not null default '#fffaf7',
  muted text not null default '#796c67',
  line text not null default '#eaded8',
  gold text not null default '#b18a52',
  hero_art_1 text not null default '#e8c9cf',
  hero_art_2 text not null default '#f3dfd7',
  hero_art_3 text not null default '#d7c2b4',
  updated_at timestamptz not null default now()
);

insert into public.site_settings (id) values (1) on conflict (id) do nothing;

-- Seed the original catalogue from the supplied Excel-derived products.json.
insert into public.products (id,name,description,price,category,image_url,wholesale,cost,active,sort_order) values
(1,'Peony Flower scented candle','Soy Wax Scented Candle with 12 diffrent colours availble with diffrent fragrances which one  you want                                                                        size: L= 3inch, Width = 3inch',399,'Scented Candles','images/product-image-1.jpg','1400/4',180,true,1),
(2,'Peony Flower Gold Scented Candle','Soy Wax Scented Candle with 12 diffrent colours availble with diffrent fragrances & Gold Plating                                                                                   size: L= 3inch, Width = 3inch',499,'Scented Candles','images/product-image-2.jpg','1500/4',200,true,2),
(3,'Peony Flower Card Candle','Tiny Scented Soy Wax Candle with Digital Print Card                                                                                 Size : Length : 1cm, width : 1cm',149,'Decorative Candles','images/product-image-3.jpg','750/4',60,true,3),
(4,'Peony Flower Scented Candle Bouquet','Scented Soy Wax Candle with Bouquet Packaging                                                                       Size : Length : 3cm, width : 3cm',399,'Gift & Bouquets','images/product-image-4.jpg','1400/4',200,true,4),
(5,'Women Pray Figure Candle','Premium Soy Wax / Paraffin Wax blend Pearl White Finish Decorative & Handmade Candle Home décor, gifting, Christmas, religious occasions, housewarming, birthdays                                    Size : Height :7inches , Width : 3inches',549,'Decorative Candles','images/product-image-5.jpg','2100/4',250,true,5),
(6,'Pink Heart Wax Melt Topped Jar Candle','Cream candle base topped with assorted pink heart and cube-shaped wax melts Soy/Paraffin Wax + Glass Jar Cotton Wick With Rose,Vanila,Strawberry Fragrence Size : length = 8cm, Width = 8cm',349,'Scented Candles','images/product-image-6.jpg','1300/4',200,true,6),
(7,'Red Heart Jelly Dessert Candle – Romantic Glass Jar Candle','Translucent red jelly-style base with a creamy white top and red heart-shaped decorations Glossy, dessert-inspired aesthetic Size:  7.5 × 7.5 × 9 cm',379,'Scented Candles','images/product-image-7.jpg','1471/4',300,true,7),
(8,'Red Heart Jelly Dessert Candle – Glass Jar Candle','Glossy red heart-shaped wax pieces, layered over a creamy white wax  Size:  9 × 9 × 11.5 cm',379,'Scented Candles','images/product-image-8.jpg','1471/4',300,true,8),
(9,'Red Heart Jelly Candle – White Cream Layer Glass Jar Candle','Transparent glass jar with a red jelly-style base containing small heart-shaped wax pieces, topped with a smooth creamy white wax layer                   Size: 7.5 × 7.5 × 9 cm',349,'Scented Candles','images/product-image-9.jpg','1449/4',200,true,9),
(10,'Red Heart Jelly Candle – White Cream Layer Glass Jar Candle','Transparent glass jar with a red jelly-style base containing small heart-shaped wax pieces, topped with a smooth creamy white wax layer  Center cotton wick  Size: 7.5 × 7.5 × 9 cm',349,'Scented Candles','images/product-image-10.jpg','1449/4',200,true,10),
(11,'Sunflower Bloom Candle','Handmade Flower-Shaped Decorative Candle Wax With Center Cotton wick size : Radius : 1.5cm',169,'Decorative Candles','images/product-image-11.jpg','600/4',80,true,11),
(12,'Daisy Flower Candle','Daisy Flower Scented Candle with card made from soy wax Size : Radius :1.5cm.',179,'Decorative Candles','images/product-image-12.jpg','699/4',90,true,12),
(13,'Happy Birthday Floral Candle Pot','Decorative candle with Daisy-style flowers, roses, leaves and heart accents Size: Diameter  = 8 inches',1249,'Decorative Candles','images/product-image-13.jpg','set of 2  2400',549,true,13),
(14,'Daisy Flower Jar Candle','A jar Filled with soy wax and topped with a Daisy Flower',499,'Scented Candles','images/product-image-14.jpg','2800  set of 6',300,true,14),
(16,'Pastel Flower Bloom Candle','A jar Filled with soy wax and topped with a Pastel Flower Size:  7.5 × 7.5 × 6.5 cm per candle',180,'Decorative Candles','images/product-image-15.jpg','999  set of 6',100,true,15),
(17,'Floral Tart Candle','Round candle with a creamy wax base, topped with detailed handmade flowers in various floral designs Smooth creamy wax with sculpted floral embellishments Size : length 4cm, Height : 4cm  per candle',230,'Decorative Candles','images/product-image-16.jpg','set of 6  1200',75,true,16),
(18,'Heart Hug Bear Candle','Adorable teddy bear sculpted entirely with intricate rose-shaped wax flowers size : length = 3cm, Width = 2cm',125,'Decorative Candles','images/product-image-17.jpg','500  set of 4',45,true,17),
(19,'Handcrafted Multicolor Daisy Flower Decorative Set','scented  soy wax candles in daisy flower shape it has multipe fragrances like rose/ Levender/ Mogra/ Lavanya  Size : Radius = 1.5 cm.',540,'Decorative Candles','images/product-image-18.jpg','1800/4',180,true,18),
(20,'Handcrafted Single color Daisy Flower Decorative','scented soy wax candles in daisy flower cone shape. It has multipe fragrances like rose/ Levender/ Mogra/ Lavanya Size : Radius = 1.5 cm.',250,'Gift & Bouquets','images/product-image-19.jpg','899/4',125,true,19),
(21,'Handcrafted Single color Daisy Flower Decorative Bouquet','scented soy wax candles in daisy flower Bouquet with 7 candles.  It has multipe fragrances like rose/ Levender/ Mogra/ Lavanya                                                                                                 Size : Radius = 1.5 cm each',630,'Decorative Candles','images/product-image-20.jpg','1200\\2',360,true,20),
(22,'Pink Daisy Flower Decorative Candle','',180,'Scented Candles','images/product-image-21.jpg','set of 4 650',125,true,21),
(23,'Glass jar candle - Baby Pink','',199,'Decorative Candles','images/product-image-22.jpg','set of 4 700',120,true,22),
(24,'Urli Lotus pearls Candle','',690,'Decorative Candles','images/product-image-23.jpg','set of 2  1400',300,true,23),
(25,'Urli Lotus leaf Candle','',690,'Scented Candles','images/product-image-24.jpg','set of 2 1400',349,true,24),
(26,'Mini Jar Candles with sunflower','',125,'Decorative Candles','images/product-image-25.jpg','set of 8 /999',75,true,25),
(27,'Pastel Bubble Cube Candle','Made by 100% Soy Wax  with matte finish and Gradient colour combination with Multiple fragrances                                                         Approx 250-350gm',null,'Scented Candles','images/product-image-26.jpg','',null,true,26),
(28,'Blush Heart Scented Candle/ Mini Heart Jar Candle','Beautiful Handcrafted Heart inspired candles soft pastel tones and charming decorative details.',null,'Decorative Candles','images/product-image-27.jpg','',null,true,27),
(29,'Succulent Garden Glass Candle','Clear Glass soy wax candle with  succulent garden green candle with Bamboo Forest Fragrance.                                             Approx : 200-300gm',null,'Scented Candles','images/product-image-28.jpg','',null,true,28),
(30,'Jar candle with Top Flower (Baby Pink )','Clear Glass jar candle with Rose/ Strawberry / Vanilla Fragrence                                   Approx : 200-250gm',null,'Scented Candles','images/product-image-29.png','',null,true,29),
(31,'Embrace Couple Sculptural Candle','Paraffin wax / candle wax Decorative and functional candle use Smooth matte/glossy wax finish                                    Approximately 300–450 g, depending on wax density',null,'Decorative Candles','images/product-image-30.jpg','',null,true,30)
on conflict (id) do update set name=excluded.name, description=excluded.description, price=excluded.price, category=excluded.category, image_url=excluded.image_url, wholesale=excluded.wholesale, cost=excluded.cost, active=true, sort_order=excluded.sort_order;

-- Admin role: create your admin user in Supabase Authentication first,
-- then insert that user's UUID here.
create table if not exists public.admins (
  user_id uuid primary key references auth.users(id) on delete cascade
);

create or replace function public.is_admin()
returns boolean
language sql
security definer
set search_path = public
stable
as $$
  select exists (select 1 from public.admins where user_id = auth.uid());
$$;

revoke all on function public.is_admin() from public;
grant execute on function public.is_admin() to anon, authenticated;

alter table public.products enable row level security;
alter table public.site_settings enable row level security;
alter table public.admins enable row level security;

drop policy if exists "Public can read active products" on public.products;
create policy "Public can read active products" on public.products
for select to anon, authenticated using (active = true or public.is_admin());

drop policy if exists "Admins can manage products" on public.products;
create policy "Admins can manage products" on public.products
for all to authenticated using (public.is_admin()) with check (public.is_admin());

drop policy if exists "Public can read site settings" on public.site_settings;
create policy "Public can read site settings" on public.site_settings
for select to anon, authenticated using (true);

drop policy if exists "Admins can manage site settings" on public.site_settings;
create policy "Admins can manage site settings" on public.site_settings
for all to authenticated using (public.is_admin()) with check (public.is_admin());

drop policy if exists "Admins can read admin rows" on public.admins;
create policy "Admins can read admin rows" on public.admins
for select to authenticated using (public.is_admin() or user_id = auth.uid());

-- Storage bucket for new product/hero images.
insert into storage.buckets (id,name,public) values ('farben-images','farben-images',true)
on conflict (id) do update set public = true;

drop policy if exists "Public can view Farben images" on storage.objects;
create policy "Public can view Farben images" on storage.objects
for select to public using (bucket_id = 'farben-images');

drop policy if exists "Admins can upload Farben images" on storage.objects;
create policy "Admins can upload Farben images" on storage.objects
for insert to authenticated with check (bucket_id = 'farben-images' and public.is_admin());

drop policy if exists "Admins can update Farben images" on storage.objects;
create policy "Admins can update Farben images" on storage.objects
for update to authenticated using (bucket_id = 'farben-images' and public.is_admin()) with check (bucket_id = 'farben-images' and public.is_admin());

drop policy if exists "Admins can delete Farben images" on storage.objects;
create policy "Admins can delete Farben images" on storage.objects
for delete to authenticated using (bucket_id = 'farben-images' and public.is_admin());

-- Enable Realtime for live product/theme changes.
alter publication supabase_realtime add table public.products;
alter publication supabase_realtime add table public.site_settings;

-- Automatically maintain updated_at timestamps.
create or replace function public.set_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end; $$;

drop trigger if exists products_updated_at on public.products;
create trigger products_updated_at before update on public.products
for each row execute function public.set_updated_at();

drop trigger if exists settings_updated_at on public.site_settings;
create trigger settings_updated_at before update on public.site_settings
for each row execute function public.set_updated_at();
