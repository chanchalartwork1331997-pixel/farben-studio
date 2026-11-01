FARBEN STUDIO — LIVE ADMIN + SEASONAL THEME

What this version does
----------------------
1. Products are stored in Supabase instead of products.json once connected.
2. Website listens to Supabase Realtime, so product price/name/description/category/visibility/image changes appear on the live website without re-uploading the site.
3. Admin login uses Supabase Auth.
4. Admin can:
   - edit product name, price, description, category and stock
   - hide/show products
   - add products
   - upload product images
   - change website theme instantly
   - choose seasonal presets: Classic, Diwali, Holi, Valentine, Christmas, Monsoon, Summer
   - turn on Auto seasonal mode
   - change homepage announcement, hero title/text and story text
5. Theme/content changes are also realtime.

ONE-TIME SETUP
--------------
A. Create a Supabase project.
B. In Supabase SQL Editor, paste and run supabase-schema.sql.
C. In Supabase Authentication, create your admin email/password user.
D. In Supabase Table Editor, open public.admins and insert that user's Auth user UUID into user_id.
E. Open config.js and replace:
   SUPABASE_URL
   SUPABASE_ANON_KEY
   with the values from Supabase Project Settings > API.
   Do NOT put the Supabase service-role/secret key in config.js.
F. Deploy the whole folder to Vercel. Do not deploy only index.html.

REAL-TIME FLOW
--------------
Admin Panel → Supabase Database/Storage → Supabase Realtime → Website

Example:
Admin changes a candle price from ₹399 to ₹449 → Save → database updates → customers currently on the website receive the update automatically.

IMPORTANT
---------
The ZIP is live-ready code, but it cannot become a truly live shared admin system until the Supabase project is connected with your own URL/key and the SQL setup is completed. This is intentional so your database credentials remain yours.
