puts "Seeding provinces..."

provinces = [
  { name: "Alberta", gst: 0.05, pst: 0.0, hst: 0.0 },
  { name: "British Columbia", gst: 0.05, pst: 0.07, hst: 0.0 },
  { name: "Manitoba", gst: 0.05, pst: 0.07, hst: 0.0 },
  { name: "New Brunswick", gst: 0.0, pst: 0.0, hst: 0.15 },
  { name: "Newfoundland and Labrador", gst: 0.0, pst: 0.0, hst: 0.15 },
  { name: "Northwest Territories", gst: 0.05, pst: 0.0, hst: 0.0 },
  { name: "Nova Scotia", gst: 0.0, pst: 0.0, hst: 0.15 },
  { name: "Nunavut", gst: 0.05, pst: 0.0, hst: 0.0 },
  { name: "Ontario", gst: 0.0, pst: 0.0, hst: 0.13 },
  { name: "Prince Edward Island", gst: 0.0, pst: 0.0, hst: 0.15 },
  { name: "Quebec", gst: 0.05, pst: 0.09975, hst: 0.0 },
  { name: "Saskatchewan", gst: 0.05, pst: 0.06, hst: 0.0 },
  { name: "Yukon", gst: 0.05, pst: 0.0, hst: 0.0 }
]

provinces.each do |p|
  Province.find_or_create_by!(name: p[:name]) do |prov|
    prov.gst = p[:gst]
    prov.pst = p[:pst]
    prov.hst = p[:hst]
  end
end

puts "Seeding categories..."

categories = [
  { name: "Computer Components", description: "CPUs, GPUs, RAM, motherboards and more" },
  { name: "Gaming Accessories", description: "Controllers, headsets, gaming mice and keyboards" },
  { name: "Monitors & Displays", description: "Gaming monitors, office displays and accessories" },
  { name: "Networking", description: "Routers, switches, cables and networking gear" },
  { name: "Storage", description: "SSDs, HDDs, USB drives and memory cards" },
  { name: "Home Office", description: "Webcams, desk accessories, and office electronics" }
]

categories.each do |c|
  Category.find_or_create_by!(name: c[:name]) do |cat|
    cat.description = c[:description]
  end
end

puts "Seeding products..."

components = Category.find_by(name: "Computer Components")
gaming = Category.find_by(name: "Gaming Accessories")
monitors = Category.find_by(name: "Monitors & Displays")
networking = Category.find_by(name: "Networking")
storage = Category.find_by(name: "Storage")
office = Category.find_by(name: "Home Office")

products = [
  { name: "AMD Ryzen 9 7900X Processor", description: "12-core, 24-thread desktop processor with 4.7 GHz base clock. Ideal for gaming and content creation workloads.", price: 449.99, stock: 15, category: components },
  { name: "Intel Core i9-13900K Processor", description: "24-core hybrid architecture processor with up to 5.8 GHz boost. Excellent for demanding workloads.", price: 589.99, stock: 10, category: components },
  { name: "AMD Ryzen 5 7600X Processor", description: "6-core processor perfect for mainstream gaming builds. Fast single-core performance.", price: 249.99, stock: 25, category: components },
  { name: "NVIDIA GeForce RTX 4070 GPU", description: "High performance graphics card with 12GB GDDR6X. Excellent for 1440p gaming.", price: 649.99, stock: 8, category: components },
  { name: "AMD Radeon RX 7900 XT GPU", description: "High-end GPU with 20GB GDDR6 memory. Great for 4K gaming and professional work.", price: 849.99, stock: 6, category: components },
  { name: "NVIDIA GeForce RTX 4060 GPU", description: "Mid-range GPU with 8GB GDDR6. Perfect for 1080p and 1440p gaming builds.", price: 399.99, stock: 18, category: components },
  { name: "Corsair Vengeance 32GB DDR5 RAM", description: "32GB (2x16GB) DDR5-5600 memory kit. High speed RAM for modern platforms.", price: 129.99, stock: 30, category: components },
  { name: "G.Skill Trident Z5 64GB DDR5 RAM", description: "64GB (2x32GB) DDR5-6000 kit with RGB lighting. For power users and creators.", price: 219.99, stock: 12, category: components },
  { name: "ASUS ROG Strix B650-E Motherboard", description: "AMD AM5 motherboard with PCIe 5.0, WiFi 6E, and robust power delivery.", price: 329.99, stock: 9, category: components },
  { name: "MSI MAG Z790 Tomahawk Motherboard", description: "Intel LGA1700 motherboard supporting DDR5. Great for gaming and content builds.", price: 289.99, stock: 11, category: components },
  { name: "Corsair RM850x PSU", description: "850W 80 Plus Gold fully modular power supply. Quiet and reliable.", price: 149.99, stock: 20, category: components },
  { name: "NZXT Kraken 240 AIO Cooler", description: "240mm all-in-one liquid CPU cooler with RGB pump head.", price: 129.99, stock: 14, category: components },
  { name: "be quiet! Dark Rock Pro 4 Cooler", description: "High-end air cooler with dual tower design. Extremely quiet operation.", price: 89.99, stock: 16, category: components },
  { name: "Fractal Design Meshify 2 Case", description: "ATX mid-tower with excellent airflow mesh front panel.", price: 139.99, stock: 13, category: components },
  { name: "NZXT H510 Flow Case", description: "Compact ATX mid-tower with tempered glass and clean cable management.", price: 99.99, stock: 22, category: components },
  { name: "Logitech G Pro X Superlight 2 Mouse", description: "Ultra-lightweight wireless gaming mouse at just 60g. HERO 25K sensor.", price: 159.99, stock: 25, category: gaming },
  { name: "Razer DeathAdder V3 Mouse", description: "Ergonomic wired gaming mouse with Focus Pro 30K sensor.", price: 89.99, stock: 30, category: gaming },
  { name: "SteelSeries Rival 650 Mouse", description: "Wireless gaming mouse with quantum wireless technology and RGB.", price: 119.99, stock: 18, category: gaming },
  { name: "Logitech G915 TKL Keyboard", description: "Tenkeyless wireless mechanical gaming keyboard with GL switches.", price: 229.99, stock: 15, category: gaming },
  { name: "Razer BlackWidow V4 Keyboard", description: "Full-size mechanical keyboard with Razer Yellow linear switches.", price: 139.99, stock: 20, category: gaming },
  { name: "Corsair K70 RGB Pro Keyboard", description: "Full mechanical keyboard with Cherry MX switches and per-key RGB.", price: 159.99, stock: 17, category: gaming },
  { name: "HyperX Cloud Alpha Headset", description: "Over-ear gaming headset with dual-chamber drivers and detachable mic.", price: 99.99, stock: 28, category: gaming },
  { name: "SteelSeries Arctis Nova Pro Headset", description: "Premium wireless gaming headset with active noise cancellation.", price: 349.99, stock: 10, category: gaming },
  { name: "Logitech G733 Wireless Headset", description: "Colorful lightweight wireless headset with Blue VO!CE mic technology.", price: 129.99, stock: 22, category: gaming },
  { name: "Xbox Elite Controller Series 2", description: "Pro controller with adjustable tension thumbsticks and hair trigger locks.", price: 189.99, stock: 14, category: gaming },
  { name: "Sony DualSense Edge Controller", description: "Premium PS5 controller with customizable back buttons and stick caps.", price: 219.99, stock: 12, category: gaming },
  { name: "ASUS ROG Chakram X Controller", description: "Wireless gaming controller compatible with PC and PlayStation.", price: 179.99, stock: 9, category: gaming },
  { name: "Logitech G440 Mouse Pad", description: "Hard gaming mouse pad optimized for high DPI gaming.", price: 29.99, stock: 40, category: gaming },
  { name: "SteelSeries QcK Heavy XL Mouse Pad", description: "Extra-large cloth mouse pad with micro-woven surface.", price: 39.99, stock: 35, category: gaming },
  { name: "Elgato Stream Deck MK.2", description: "15 customizable LCD keys for streaming and content creation control.", price: 149.99, stock: 16, category: gaming },
  { name: "LG 27GP850-B 27-inch Monitor", description: "27-inch QHD 165Hz IPS gaming monitor with 1ms response time.", price: 379.99, stock: 11, category: monitors },
  { name: "Samsung Odyssey G7 32-inch Monitor", description: "32-inch QHD 240Hz curved gaming monitor with 1ms response time.", price: 649.99, stock: 7, category: monitors },
  { name: "ASUS ProArt PA278QV Monitor", description: "27-inch QHD IPS professional monitor with 100% sRGB coverage.", price: 349.99, stock: 9, category: monitors },
  { name: "Dell S2722DGM Monitor", description: "27-inch QHD 165Hz curved VA gaming monitor.", price: 299.99, stock: 13, category: monitors },
  { name: "LG 34WP65C Ultrawide Monitor", description: "34-inch ultrawide curved QHD monitor with 160Hz refresh rate.", price: 499.99, stock: 8, category: monitors },
  { name: "BenQ MOBIUZ EX2710Q Monitor", description: "27-inch QHD 165Hz IPS gaming monitor with HDRi technology.", price: 329.99, stock: 10, category: monitors },
  { name: "AOC C27G2Z Monitor", description: "27-inch FHD 240Hz curved VA gaming monitor, great value pick.", price: 229.99, stock: 18, category: monitors },
  { name: "ASUS TUF Gaming VG27AQ Monitor", description: "27-inch QHD 165Hz IPS monitor with G-Sync Compatible support.", price: 319.99, stock: 12, category: monitors },
  { name: "TP-Link Archer AX6000 Router", description: "WiFi 6 router with 6000 Mbps speeds and 8 antennas.", price: 299.99, stock: 14, category: networking },
  { name: "ASUS RT-AX88U Router", description: "Dual-band WiFi 6 router with 8 LAN ports and AiMesh support.", price: 249.99, stock: 11, category: networking },
  { name: "Netgear Nighthawk AX12 Router", description: "12-stream WiFi 6 router with 10.8 Gbps total throughput.", price: 399.99, stock: 8, category: networking },
  { name: "TP-Link TL-SG108 Switch", description: "8-port Gigabit unmanaged desktop switch for home and office.", price: 29.99, stock: 40, category: networking },
  { name: "Netgear GS308 Switch", description: "8-port Gigabit Ethernet unmanaged switch with plug-and-play setup.", price: 34.99, stock: 35, category: networking },
  { name: "Cable Matters 10GbE Network Card", description: "PCIe 10Gbps network adapter with Intel X550-AT chip.", price: 89.99, stock: 20, category: networking },
  { name: "Eero Pro 6 Mesh WiFi System", description: "3-pack WiFi 6 mesh system covering up to 6000 sq ft.", price: 349.99, stock: 10, category: networking },
  { name: "Ubiquiti UniFi AP AC Pro", description: "Enterprise-grade access point with 1750 Mbps and dual-band.", price: 189.99, stock: 9, category: networking },
  { name: "Cat8 Ethernet Cable 25ft", description: "25-foot Cat8 shielded ethernet cable with 40Gbps support.", price: 19.99, stock: 60, category: networking },
  { name: "Samsung 990 Pro 1TB NVMe SSD", description: "PCIe 4.0 NVMe SSD with 7450 MB/s sequential read speed.", price: 139.99, stock: 22, category: storage },
  { name: "WD Black SN850X 2TB NVMe SSD", description: "PCIe 4.0 NVMe SSD designed for gaming with 7300 MB/s reads.", price: 189.99, stock: 16, category: storage },
  { name: "Crucial P3 1TB NVMe SSD", description: "Budget-friendly PCIe 3.0 NVMe SSD with 3500 MB/s reads.", price: 79.99, stock: 35, category: storage },
  { name: "Seagate Barracuda 2TB HDD", description: "3.5-inch 7200RPM hard drive for bulk storage needs.", price: 64.99, stock: 30, category: storage },
  { name: "WD Red Plus 4TB NAS HDD", description: "NAS-optimized hard drive with 3D Active Balance technology.", price: 109.99, stock: 18, category: storage },
  { name: "Samsung T7 Portable SSD 1TB", description: "USB 3.2 Gen 2 portable SSD with 1050 MB/s read speeds.", price: 99.99, stock: 28, category: storage },
  { name: "SanDisk Extreme Pro 256GB microSD", description: "UHS-I microSD card with 200 MB/s read for cameras and drones.", price: 44.99, stock: 45, category: storage },
  { name: "Kingston DataTraveler 256GB USB Drive", description: "USB 3.2 Gen 1 flash drive with durable metal casing.", price: 34.99, stock: 50, category: storage },
  { name: "Sabrent Rocket 4 Plus 4TB NVMe SSD", description: "High capacity PCIe 4.0 NVMe drive for professionals.", price: 349.99, stock: 8, category: storage },
  { name: "Logitech C920s HD Pro Webcam", description: "1080p 30fps webcam with privacy shutter and stereo audio.", price: 89.99, stock: 30, category: office },
  { name: "Elgato Facecam Pro Webcam", description: "4K webcam with Sony STARVIS sensor for streaming and calls.", price: 299.99, stock: 12, category: office },
  { name: "Blue Yeti USB Microphone", description: "Professional USB condenser microphone with multiple pickup patterns.", price: 129.99, stock: 20, category: office },
  { name: "Rode NT-USB Mini Microphone", description: "Compact studio-quality USB microphone for home recording.", price: 99.99, stock: 18, category: office },
  { name: "Ergotron LX Monitor Arm", description: "Full motion desk mount monitor arm supporting up to 34-inch displays.", price: 159.99, stock: 15, category: office },
  { name: "Fully Jarvis Monitor Arm", description: "Heavy-duty single monitor arm with cable management channels.", price: 119.99, stock: 17, category: office },
  { name: "Logitech MX Keys Keyboard", description: "Wireless illuminated keyboard with smart backlighting and USB-C charging.", price: 129.99, stock: 22, category: office },
  { name: "Logitech MX Master 3S Mouse", description: "Advanced wireless mouse with MagSpeed scroll and 8K DPI sensor.", price: 109.99, stock: 25, category: office },
  { name: "Anker 10-Port USB Hub", description: "Powered USB 3.0 hub with 7 data ports and 3 charging ports.", price: 49.99, stock: 35, category: office },
  { name: "Belkin 12-Outlet Surge Protector", description: "12-outlet power strip with 4320 joule surge protection.", price: 59.99, stock: 28, category: office },
  { name: "APC Back-UPS 1500VA UPS", description: "Uninterruptible power supply with 10 outlets and AVR.", price: 199.99, stock: 12, category: office },
  { name: "Twelve South HiRise Pro Desk Stand", description: "Adjustable aluminum laptop and tablet stand for desk use.", price: 79.99, stock: 20, category: office }
]

products.each do |p|
  Product.find_or_create_by!(name: p[:name]) do |prod|
    prod.description = p[:description]
    prod.price = p[:price]
    prod.stock = p[:stock]
    prod.category = p[:category]
  end
end

puts "Done! #{Province.count} provinces, #{Category.count} categories, #{Product.count} products."
EOFcat > db/seeds.rb << 'EOF'
puts "Seeding provinces..."

provinces = [
  { name: "Alberta", gst: 0.05, pst: 0.0, hst: 0.0 },
  { name: "British Columbia", gst: 0.05, pst: 0.07, hst: 0.0 },
  { name: "Manitoba", gst: 0.05, pst: 0.07, hst: 0.0 },
  { name: "New Brunswick", gst: 0.0, pst: 0.0, hst: 0.15 },
  { name: "Newfoundland and Labrador", gst: 0.0, pst: 0.0, hst: 0.15 },
  { name: "Northwest Territories", gst: 0.05, pst: 0.0, hst: 0.0 },
  { name: "Nova Scotia", gst: 0.0, pst: 0.0, hst: 0.15 },
  { name: "Nunavut", gst: 0.05, pst: 0.0, hst: 0.0 },
  { name: "Ontario", gst: 0.0, pst: 0.0, hst: 0.13 },
  { name: "Prince Edward Island", gst: 0.0, pst: 0.0, hst: 0.15 },
  { name: "Quebec", gst: 0.05, pst: 0.09975, hst: 0.0 },
  { name: "Saskatchewan", gst: 0.05, pst: 0.06, hst: 0.0 },
  { name: "Yukon", gst: 0.05, pst: 0.0, hst: 0.0 }
]

provinces.each do |p|
  Province.find_or_create_by!(name: p[:name]) do |prov|
    prov.gst = p[:gst]
    prov.pst = p[:pst]
    prov.hst = p[:hst]
  end
end

puts "Seeding categories..."

categories = [
  { name: "Computer Components", description: "CPUs, GPUs, RAM, motherboards and more" },
  { name: "Gaming Accessories", description: "Controllers, headsets, gaming mice and keyboards" },
  { name: "Monitors & Displays", description: "Gaming monitors, office displays and accessories" },
  { name: "Networking", description: "Routers, switches, cables and networking gear" },
  { name: "Storage", description: "SSDs, HDDs, USB drives and memory cards" },
  { name: "Home Office", description: "Webcams, desk accessories, and office electronics" }
]

categories.each do |c|
  Category.find_or_create_by!(name: c[:name]) do |cat|
    cat.description = c[:description]
  end
end

puts "Seeding products..."

components = Category.find_by(name: "Computer Components")
gaming = Category.find_by(name: "Gaming Accessories")
monitors = Category.find_by(name: "Monitors & Displays")
networking = Category.find_by(name: "Networking")
storage = Category.find_by(name: "Storage")
office = Category.find_by(name: "Home Office")

products = [
  { name: "AMD Ryzen 9 7900X Processor", description: "12-core, 24-thread desktop processor with 4.7 GHz base clock. Ideal for gaming and content creation workloads.", price: 449.99, stock: 15, category: components },
  { name: "Intel Core i9-13900K Processor", description: "24-core hybrid architecture processor with up to 5.8 GHz boost. Excellent for demanding workloads.", price: 589.99, stock: 10, category: components },
  { name: "AMD Ryzen 5 7600X Processor", description: "6-core processor perfect for mainstream gaming builds. Fast single-core performance.", price: 249.99, stock: 25, category: components },
  { name: "NVIDIA GeForce RTX 4070 GPU", description: "High performance graphics card with 12GB GDDR6X. Excellent for 1440p gaming.", price: 649.99, stock: 8, category: components },
  { name: "AMD Radeon RX 7900 XT GPU", description: "High-end GPU with 20GB GDDR6 memory. Great for 4K gaming and professional work.", price: 849.99, stock: 6, category: components },
  { name: "NVIDIA GeForce RTX 4060 GPU", description: "Mid-range GPU with 8GB GDDR6. Perfect for 1080p and 1440p gaming builds.", price: 399.99, stock: 18, category: components },
  { name: "Corsair Vengeance 32GB DDR5 RAM", description: "32GB (2x16GB) DDR5-5600 memory kit. High speed RAM for modern platforms.", price: 129.99, stock: 30, category: components },
  { name: "G.Skill Trident Z5 64GB DDR5 RAM", description: "64GB (2x32GB) DDR5-6000 kit with RGB lighting. For power users and creators.", price: 219.99, stock: 12, category: components },
  { name: "ASUS ROG Strix B650-E Motherboard", description: "AMD AM5 motherboard with PCIe 5.0, WiFi 6E, and robust power delivery.", price: 329.99, stock: 9, category: components },
  { name: "MSI MAG Z790 Tomahawk Motherboard", description: "Intel LGA1700 motherboard supporting DDR5. Great for gaming and content builds.", price: 289.99, stock: 11, category: components },
  { name: "Corsair RM850x PSU", description: "850W 80 Plus Gold fully modular power supply. Quiet and reliable.", price: 149.99, stock: 20, category: components },
  { name: "NZXT Kraken 240 AIO Cooler", description: "240mm all-in-one liquid CPU cooler with RGB pump head.", price: 129.99, stock: 14, category: components },
  { name: "be quiet! Dark Rock Pro 4 Cooler", description: "High-end air cooler with dual tower design. Extremely quiet operation.", price: 89.99, stock: 16, category: components },
  { name: "Fractal Design Meshify 2 Case", description: "ATX mid-tower with excellent airflow mesh front panel.", price: 139.99, stock: 13, category: components },
  { name: "NZXT H510 Flow Case", description: "Compact ATX mid-tower with tempered glass and clean cable management.", price: 99.99, stock: 22, category: components },
  { name: "Logitech G Pro X Superlight 2 Mouse", description: "Ultra-lightweight wireless gaming mouse at just 60g. HERO 25K sensor.", price: 159.99, stock: 25, category: gaming },
  { name: "Razer DeathAdder V3 Mouse", description: "Ergonomic wired gaming mouse with Focus Pro 30K sensor.", price: 89.99, stock: 30, category: gaming },
  { name: "SteelSeries Rival 650 Mouse", description: "Wireless gaming mouse with quantum wireless technology and RGB.", price: 119.99, stock: 18, category: gaming },
  { name: "Logitech G915 TKL Keyboard", description: "Tenkeyless wireless mechanical gaming keyboard with GL switches.", price: 229.99, stock: 15, category: gaming },
  { name: "Razer BlackWidow V4 Keyboard", description: "Full-size mechanical keyboard with Razer Yellow linear switches.", price: 139.99, stock: 20, category: gaming },
  { name: "Corsair K70 RGB Pro Keyboard", description: "Full mechanical keyboard with Cherry MX switches and per-key RGB.", price: 159.99, stock: 17, category: gaming },
  { name: "HyperX Cloud Alpha Headset", description: "Over-ear gaming headset with dual-chamber drivers and detachable mic.", price: 99.99, stock: 28, category: gaming },
  { name: "SteelSeries Arctis Nova Pro Headset", description: "Premium wireless gaming headset with active noise cancellation.", price: 349.99, stock: 10, category: gaming },
  { name: "Logitech G733 Wireless Headset", description: "Colorful lightweight wireless headset with Blue VO!CE mic technology.", price: 129.99, stock: 22, category: gaming },
  { name: "Xbox Elite Controller Series 2", description: "Pro controller with adjustable tension thumbsticks and hair trigger locks.", price: 189.99, stock: 14, category: gaming },
  { name: "Sony DualSense Edge Controller", description: "Premium PS5 controller with customizable back buttons and stick caps.", price: 219.99, stock: 12, category: gaming },
  { name: "ASUS ROG Chakram X Controller", description: "Wireless gaming controller compatible with PC and PlayStation.", price: 179.99, stock: 9, category: gaming },
  { name: "Logitech G440 Mouse Pad", description: "Hard gaming mouse pad optimized for high DPI gaming.", price: 29.99, stock: 40, category: gaming },
  { name: "SteelSeries QcK Heavy XL Mouse Pad", description: "Extra-large cloth mouse pad with micro-woven surface.", price: 39.99, stock: 35, category: gaming },
  { name: "Elgato Stream Deck MK.2", description: "15 customizable LCD keys for streaming and content creation control.", price: 149.99, stock: 16, category: gaming },
  { name: "LG 27GP850-B 27-inch Monitor", description: "27-inch QHD 165Hz IPS gaming monitor with 1ms response time.", price: 379.99, stock: 11, category: monitors },
  { name: "Samsung Odyssey G7 32-inch Monitor", description: "32-inch QHD 240Hz curved gaming monitor with 1ms response time.", price: 649.99, stock: 7, category: monitors },
  { name: "ASUS ProArt PA278QV Monitor", description: "27-inch QHD IPS professional monitor with 100% sRGB coverage.", price: 349.99, stock: 9, category: monitors },
  { name: "Dell S2722DGM Monitor", description: "27-inch QHD 165Hz curved VA gaming monitor.", price: 299.99, stock: 13, category: monitors },
  { name: "LG 34WP65C Ultrawide Monitor", description: "34-inch ultrawide curved QHD monitor with 160Hz refresh rate.", price: 499.99, stock: 8, category: monitors },
  { name: "BenQ MOBIUZ EX2710Q Monitor", description: "27-inch QHD 165Hz IPS gaming monitor with HDRi technology.", price: 329.99, stock: 10, category: monitors },
  { name: "AOC C27G2Z Monitor", description: "27-inch FHD 240Hz curved VA gaming monitor, great value pick.", price: 229.99, stock: 18, category: monitors },
  { name: "ASUS TUF Gaming VG27AQ Monitor", description: "27-inch QHD 165Hz IPS monitor with G-Sync Compatible support.", price: 319.99, stock: 12, category: monitors },
  { name: "TP-Link Archer AX6000 Router", description: "WiFi 6 router with 6000 Mbps speeds and 8 antennas.", price: 299.99, stock: 14, category: networking },
  { name: "ASUS RT-AX88U Router", description: "Dual-band WiFi 6 router with 8 LAN ports and AiMesh support.", price: 249.99, stock: 11, category: networking },
  { name: "Netgear Nighthawk AX12 Router", description: "12-stream WiFi 6 router with 10.8 Gbps total throughput.", price: 399.99, stock: 8, category: networking },
  { name: "TP-Link TL-SG108 Switch", description: "8-port Gigabit unmanaged desktop switch for home and office.", price: 29.99, stock: 40, category: networking },
  { name: "Netgear GS308 Switch", description: "8-port Gigabit Ethernet unmanaged switch with plug-and-play setup.", price: 34.99, stock: 35, category: networking },
  { name: "Cable Matters 10GbE Network Card", description: "PCIe 10Gbps network adapter with Intel X550-AT chip.", price: 89.99, stock: 20, category: networking },
  { name: "Eero Pro 6 Mesh WiFi System", description: "3-pack WiFi 6 mesh system covering up to 6000 sq ft.", price: 349.99, stock: 10, category: networking },
  { name: "Ubiquiti UniFi AP AC Pro", description: "Enterprise-grade access point with 1750 Mbps and dual-band.", price: 189.99, stock: 9, category: networking },
  { name: "Cat8 Ethernet Cable 25ft", description: "25-foot Cat8 shielded ethernet cable with 40Gbps support.", price: 19.99, stock: 60, category: networking },
  { name: "Samsung 990 Pro 1TB NVMe SSD", description: "PCIe 4.0 NVMe SSD with 7450 MB/s sequential read speed.", price: 139.99, stock: 22, category: storage },
  { name: "WD Black SN850X 2TB NVMe SSD", description: "PCIe 4.0 NVMe SSD designed for gaming with 7300 MB/s reads.", price: 189.99, stock: 16, category: storage },
  { name: "Crucial P3 1TB NVMe SSD", description: "Budget-friendly PCIe 3.0 NVMe SSD with 3500 MB/s reads.", price: 79.99, stock: 35, category: storage },
  { name: "Seagate Barracuda 2TB HDD", description: "3.5-inch 7200RPM hard drive for bulk storage needs.", price: 64.99, stock: 30, category: storage },
  { name: "WD Red Plus 4TB NAS HDD", description: "NAS-optimized hard drive with 3D Active Balance technology.", price: 109.99, stock: 18, category: storage },
  { name: "Samsung T7 Portable SSD 1TB", description: "USB 3.2 Gen 2 portable SSD with 1050 MB/s read speeds.", price: 99.99, stock: 28, category: storage },
  { name: "SanDisk Extreme Pro 256GB microSD", description: "UHS-I microSD card with 200 MB/s read for cameras and drones.", price: 44.99, stock: 45, category: storage },
  { name: "Kingston DataTraveler 256GB USB Drive", description: "USB 3.2 Gen 1 flash drive with durable metal casing.", price: 34.99, stock: 50, category: storage },
  { name: "Sabrent Rocket 4 Plus 4TB NVMe SSD", description: "High capacity PCIe 4.0 NVMe drive for professionals.", price: 349.99, stock: 8, category: storage },
  { name: "Logitech C920s HD Pro Webcam", description: "1080p 30fps webcam with privacy shutter and stereo audio.", price: 89.99, stock: 30, category: office },
  { name: "Elgato Facecam Pro Webcam", description: "4K webcam with Sony STARVIS sensor for streaming and calls.", price: 299.99, stock: 12, category: office },
  { name: "Blue Yeti USB Microphone", description: "Professional USB condenser microphone with multiple pickup patterns.", price: 129.99, stock: 20, category: office },
  { name: "Rode NT-USB Mini Microphone", description: "Compact studio-quality USB microphone for home recording.", price: 99.99, stock: 18, category: office },
  { name: "Ergotron LX Monitor Arm", description: "Full motion desk mount monitor arm supporting up to 34-inch displays.", price: 159.99, stock: 15, category: office },
  { name: "Fully Jarvis Monitor Arm", description: "Heavy-duty single monitor arm with cable management channels.", price: 119.99, stock: 17, category: office },
  { name: "Logitech MX Keys Keyboard", description: "Wireless illuminated keyboard with smart backlighting and USB-C charging.", price: 129.99, stock: 22, category: office },
  { name: "Logitech MX Master 3S Mouse", description: "Advanced wireless mouse with MagSpeed scroll and 8K DPI sensor.", price: 109.99, stock: 25, category: office },
  { name: "Anker 10-Port USB Hub", description: "Powered USB 3.0 hub with 7 data ports and 3 charging ports.", price: 49.99, stock: 35, category: office },
  { name: "Belkin 12-Outlet Surge Protector", description: "12-outlet power strip with 4320 joule surge protection.", price: 59.99, stock: 28, category: office },
  { name: "APC Back-UPS 1500VA UPS", description: "Uninterruptible power supply with 10 outlets and AVR.", price: 199.99, stock: 12, category: office },
  { name: "Twelve South HiRise Pro Desk Stand", description: "Adjustable aluminum laptop and tablet stand for desk use.", price: 79.99, stock: 20, category: office }
]

products.each do |p|
  Product.find_or_create_by!(name: p[:name]) do |prod|
    prod.description = p[:description]
    prod.price = p[:price]
    prod.stock = p[:stock]
    prod.category = p[:category]
  end
end

puts "Done! #{Province.count} provinces, #{Category.count} categories, #{Product.count} products."
