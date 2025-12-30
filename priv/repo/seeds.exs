# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Rambnb.Repo.insert!(%Rambnb.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Rambnb.Repo
alias Rambnb.Catalog.Listing

ram_images = [
  "https://images.unsplash.com/photo-1625948515291-69613efd103f?w=800",
  "https://images.unsplash.com/photo-1591488320449-011701bb6704?w=800",
  "https://images.unsplash.com/photo-1555617981-dac3880eac6e?w=800",
  "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=800",
  "https://images.unsplash.com/photo-1504384308090-c894fdcc538d?w=800",
  "https://images.unsplash.com/photo-1624823183493-ed5832f48f18?w=800",
  "https://images.unsplash.com/photo-1517433456452-f9633a875f6f?w=800",
  "https://images.unsplash.com/photo-1487058792275-0ad4aaf24ca7?w=800"
]

insert_listing = fn attrs ->
  listing =
    case attrs do
      %Listing{} -> attrs
      %{} -> struct(Listing, attrs)
    end

  Repo.get_by(Listing, title: listing.title) || Repo.insert!(listing)
end

# Seed RAM listings only if they are missing.
listings = [
  %{
    title: "Cozy 8GB DDR4 Stick - Perfect for Chrome Tabs",
    memory_type: "DDR4",
    capacity: 8,
    speed: "3200 MHz",
    brand: "Corsair",
    price_per_day: Decimal.new("49.99"),
    location: "Silicon Valley, CA",
    description:
      "Charming 8GB DDR4 memory stick with stunning RGB lighting. Recently upgraded, can handle up to 12 Chrome tabs simultaneously! Perfect for casual browsing and pretending to work. Host provides complementary thermal paste. No smoking, no mining.",
    image_url: "https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?w=800",
    available: true
  },
  %{
    title: "Luxurious 32GB DDR5 Beast - Gaming Paradise",
    memory_type: "DDR5",
    capacity: 32,
    speed: "6000 MHz",
    brand: "G.Skill",
    price_per_day: Decimal.new("149.99"),
    location: "Austin, TX",
    description:
      "Absolutely gorgeous DDR5 memory with panoramic RGB views. This beauty can handle Cyberpunk 2077 AND Discord at the same time. Recently refurbished, minimal thermal throttling. Perfect for gaming, streaming, or running that one Electron app that somehow needs 8GB. Superhost status!",
    image_url: "https://images.unsplash.com/photo-1625948515291-69613efd103f?w=800",
    available: true
  },
  %{
    title: "Budget-Friendly 4GB DDR3 Stick - Vintage Charm",
    memory_type: "DDR3",
    capacity: 4,
    speed: "1600 MHz",
    brand: "Kingston",
    price_per_day: Decimal.new("19.99"),
    location: "Detroit, MI",
    description:
      "Rustic DDR3 with lots of character! Been around the block a few times but still kicking. Great for running Windows XP in a VM or that one legacy app your company refuses to update. No RGB, no frills, just honest memory. Can handle Notepad and Calculator at the same time.",
    image_url: "https://images.unsplash.com/photo-1562976540-1502c2145186?w=800",
    available: true
  },
  %{
    title: "Premium 64GB DDR5 Suite - Content Creator's Dream",
    memory_type: "DDR5",
    capacity: 64,
    speed: "6400 MHz",
    brand: "Corsair",
    price_per_day: Decimal.new("249.99"),
    location: "Los Angeles, CA",
    description:
      "Stunning DDR5 kit with unobstructed bandwidth views. Perfect for rendering those 4K videos or running 50 Docker containers you forgot about. Can handle Adobe Creative Cloud without crying. Features include: low-profile heatsink, works great with air cooling, and yes, more RGB than a gaming keyboard convention.",
    image_url: "https://images.unsplash.com/photo-1624823183493-ed5832f48f18?w=800",
    available: true
  },
  %{
    title: "Quirky 16GB DDR4 Dual-Channel Set - Electron Approved",
    memory_type: "DDR4",
    capacity: 16,
    speed: "3600 MHz",
    brand: "Crucial",
    price_per_day: Decimal.new("79.99"),
    location: "Seattle, WA",
    description:
      "Adorable 2x8GB kit certified by the Electron Foundation for running Slack, VS Code, and Spotify simultaneously. Comes with a fascinating history - was once used to compile Chromium from source. RGB-free for the minimalists. Perfect for developers who somehow need 16GB just to write JavaScript.",
    image_url: "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=800",
    available: true
  },
  %{
    title: "Entire 128GB DDR5 Estate - Server Grade Luxury",
    memory_type: "DDR5",
    capacity: 128,
    speed: "5600 MHz",
    brand: "Kingston",
    price_per_day: Decimal.new("499.99"),
    location: "New York, NY",
    description:
      "Palatial 4x32GB DDR5 setup for the discerning professional. Can run literally everything. Chrome with 100 tabs? Check. 15 Electron apps? Easy. Minecraft with ALL the mods? Done. Your company's enterprise Java application? Still has RAM to spare. ECC supported but therapy not included.",
    image_url: "https://images.unsplash.com/photo-1487014679447-9f8336841d58?w=800",
    available: true
  },
  %{
    title: "Compact 8GB DDR3 Studio - Work From Home Special",
    memory_type: "DDR3",
    capacity: 8,
    speed: "1866 MHz",
    brand: "G.Skill",
    price_per_day: Decimal.new("29.99"),
    location: "Portland, OR",
    description:
      "Cute little DDR3 kit perfect for working from home, as long as your work involves exactly one application at a time. Zoom OR Excel, not both. Browser tabs limited to 5. Includes free performance anxiety when Windows Update starts. Great conversation starter about 'the good old days' of computing.",
    image_url: "https://images.unsplash.com/photo-1493723843671-1d655e66ac1c?w=800",
    available: true
  },
  %{
    title: "Spacious 48GB DDR5 Loft - The Sweet Spot",
    memory_type: "DDR5",
    capacity: 48,
    speed: "5200 MHz",
    brand: "TeamGroup",
    price_per_day: Decimal.new("179.99"),
    location: "Denver, CO",
    description:
      "Recently renovated 2x24GB setup with excellent price-to-performance ratio. Not too much, not too little - the Goldilocks of RAM. Perfect for gaming, programming, and running all your chat apps simultaneously. Can handle your 'quick' IntelliJ startup time. Pet-friendly (supports virtual machines).",
    image_url: "https://images.unsplash.com/photo-1478358161113-b0e11994a36b?w=800",
    available: true
  },
  %{
    title: "Ultra 96GB DDR5 Penthouse - Creator's Playground",
    memory_type: "DDR5",
    capacity: 96,
    speed: "6000 MHz",
    brand: "G.Skill",
    price_per_day: Decimal.new("379.99"),
    location: "San Francisco, CA",
    description:
      "Magnificent 2x48GB DDR5 setup with breathtaking speed. Render 8K video while gaming while hosting a Minecraft server. Your Docker containers finally have a home. Blender simulations complete before your coffee gets cold. Warning: May cause unrealistic expectations about computer performance.",
    image_url: "https://images.unsplash.com/photo-1481277542470-605612bd2d61?w=800",
    available: true
  },
  %{
    title: "Modest 2GB DDR2 Cabin - Retro Computing Experience",
    memory_type: "DDR2",
    capacity: 2,
    speed: "800 MHz",
    brand: "Samsung",
    price_per_day: Decimal.new("9.99"),
    location: "Cleveland, OH",
    description:
      "Vintage DDR2 stick for the true enthusiast. Perfect for that Windows 7 nostalgia trip or running DOS games. Can barely handle modern web browsers, but makes a great story. Low heat output (because it's barely doing anything). No smart home features, no IoT, just pure, simple memory from a simpler time.",
    image_url: "https://images.unsplash.com/photo-1555617981-dac3880eac6e?w=800",
    available: false
  }
]

Enum.each(listings, insert_listing)

insert_listing.(%Listing{
  title: "Exclusive 256GB DDR5 Mansion - Data Center Vibes",
  memory_type: "DDR5",
  capacity: 256,
  speed: "5600 MHz",
  brand: "Samsung",
  price_per_day: Decimal.new("899.99"),
  location: "Palo Alto, CA",
  description: "Absolute unit. 8x32GB DDR5 configuration that laughs at workloads. Train machine learning models, run every container in existence, keep all your Chrome tabs AND Firefox tabs open. Includes complementary existential crisis about why anyone needs this much RAM. Perfect for showing off at LAN parties.",
  image_url: "https://images.unsplash.com/photo-1587202372775-e229f172b9d7?w=800",
  available: true
})

insert_listing.(%Listing{
  title: "Charming 12GB DDR4 Cottage - The Odd One Out",
  memory_type: "DDR4",
  capacity: 12,
  speed: "2666 MHz",
  brand: "Crucial",
  price_per_day: Decimal.new("59.99"),
  location: "Minneapolis, MN",
  description: "Quirky 4GB + 8GB dual-channel setup. Yes, it's weird. Yes, it works. Perfect for the budget-conscious who bought whatever was on sale. Runs most things adequately. Great for teaching kids about 'making do with what you have.' Character-building RAM.",
  image_url: "https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?w=800",
  available: true
})

insert_listing.(%Listing{
  title: "Deluxe 192GB DDR5 Villa - Render Farm Ready",
  memory_type: "DDR5",
  capacity: 192,
  speed: "6400 MHz",
  brand: "G.Skill",
  price_per_day: Decimal.new("699.99"),
  location: "Vancouver, BC",
  description: "Professional-grade 6x32GB DDR5 beast. Render that 3D animation before the heat death of the universe. Compile entire operating systems during lunch break. Run simulations of simulations. Your IDE will actually be snappy. Warning: Your CPU might become the bottleneck.",
  image_url: "https://images.unsplash.com/photo-1591488320449-011701bb6704?w=800",
  available: true
})

insert_listing.(%Listing{
  title: "Minimalist 6GB DDR3 Shack - Bare Essentials",
  memory_type: "DDR3",
  capacity: 6,
  speed: "1333 MHz",
  brand: "Kingston",
  price_per_day: Decimal.new("24.99"),
  location: "Buffalo, NY",
  description: "Mismatched 4GB + 2GB configuration for the truly desperate. Dual-channel? Never heard of her. Runs Windows 10... eventually. Perfect for teaching patience and lowering expectations. Builds character. Actual performance may vary (it will vary badly).",
  image_url: "https://images.unsplash.com/photo-1562976540-1502c2145186?w=800",
  available: true
})

insert_listing.(%Listing{
  title: "Professional 80GB DDR4 Office - Workstation Dreams",
  memory_type: "DDR4",
  capacity: 80,
  speed: "3200 MHz",
  brand: "Corsair",
  price_per_day: Decimal.new("299.99"),
  location: "Boston, MA",
  description: "Serious 4x20GB DDR4 kit for serious work. CAD? Check. Multiple VMs? Check. That massive Excel file that brings lesser machines to their knees? Finally defeated. Perfect for professionals who are tired of watching spinning wheels. No RGB to distract from productivity.",
  image_url: "https://images.unsplash.com/photo-1503602642458-232111445657?w=800",
  available: true
})

insert_listing.(%Listing{
  title: "Trendy 24GB DDR5 Apartment - Just Right For Most",
  memory_type: "DDR5",
  capacity: 24,
  speed: "5600 MHz",
  brand: "Crucial",
  price_per_day: Decimal.new("119.99"),
  location: "Nashville, TN",
  description: "Modern 2x12GB DDR5 setup hitting the sweet spot. Enough for modern gaming, enough for development work, enough for your questionable number of browser tabs. Not too much, not too little. The sensible choice your wallet will appreciate. Still has that new RAM smell.",
  image_url: "https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?w=800",
  available: true
})

insert_listing.(%Listing{
  title: "Extreme 512GB DDR5 Compound - Because Why Not",
  memory_type: "DDR5",
  capacity: 512,
  speed: "5200 MHz",
  brand: "Kingston",
  price_per_day: Decimal.new("1999.99"),
  location: "Cupertino, CA",
  description: "This is what happens when money is no object. 16x32GB DDR5 configuration that could probably achieve sentience. Run the entire internet locally. Host every VM. Keep Task Manager open just to admire the number. Requires industrial cooling and a second mortgage. Therapist recommended.",
  image_url: "https://images.unsplash.com/photo-1451187580459-43490279c0fa?w=800",
  available: true
})

insert_listing.(%Listing{
  title: "Experimental 40GB DDR4 Lab - Mixed and Matched",
  memory_type: "DDR4",
  capacity: 40,
  speed: "3000 MHz",
  brand: "TeamGroup",
  price_per_day: Decimal.new("139.99"),
  location: "Raleigh, NC",
  description: "Frankenstein's creation: 4x8GB + 1x8GB configuration that somehow works. Breaks every best practice. Your motherboard is confused but supportive. Great for testing, experimentation, or living dangerously. Stability not guaranteed but surprisingly reliable. RGB lighting on some sticks only.",
  image_url: "https://images.unsplash.com/photo-1625948515291-69613efd103f?w=800",
  available: true
})

insert_listing.(%Listing{
  title: "Classic 1GB DDR Museum Piece - History Lesson",
  memory_type: "DDR",
  capacity: 1,
  speed: "400 MHz",
  brand: "Crucial",
  price_per_day: Decimal.new("4.99"),
  location: "Pittsburgh, PA",
  description: "Ancient DDR1 artifact from the early 2000s. More of a museum piece than functional RAM. Perfect for retro builds, nostalgia trips, or showing kids how good they have it. Can run Windows XP like a champion. Modern websites will make it cry. Comes with stories of the old days.",
  image_url: Enum.at(ram_images, 2),
  available: true
})

# New listings
insert_listing.(%Listing{
  title: "Sleek 20GB DDR4 Hybrid - The Unconventional Choice",
  memory_type: "DDR4",
  capacity: 20,
  speed: "3200 MHz",
  brand: "Corsair",
  price_per_day: Decimal.new("89.99"),
  location: "Chicago, IL",
  description: "Unique 16GB + 4GB configuration that defies convention. Not quite 16GB, more than 24GB would be. Perfect for those who like living on the edge of dual-channel optimization. Runs games at high settings while your second monitor displays spreadsheets. The RAM equivalent of ordering a medium drink.",
  image_url: Enum.at(ram_images, 3),
  available: true
})

insert_listing.(%Listing{
  title: "Pristine 32GB DDR4 Paradise - Balanced Excellence",
  memory_type: "DDR4",
  capacity: 32,
  speed: "3600 MHz",
  brand: "G.Skill",
  price_per_day: Decimal.new("129.99"),
  location: "San Diego, CA",
  description: "Perfect 2x16GB DDR4 configuration that just works. Not too flashy, not too boring. RGB lighting that you can actually turn off. Ideal for those who want performance without the premium DDR5 tax. Can multitask like a boss. Comes with our 'It Just Works™' guarantee.",
  image_url: Enum.at(ram_images, 4),
  available: true
})

insert_listing.(%Listing{
  title: "Magnificent 384GB DDR5 Palace - Enterprise Elite",
  memory_type: "DDR5",
  capacity: 384,
  speed: "5600 MHz",
  brand: "Samsung",
  price_per_day: Decimal.new("1499.99"),
  location: "Seattle, WA",
  description: "When 256GB just isn't enough. 12x32GB DDR5 configuration for the truly ambitious. Run your own private cloud. Host databases for fun. Make your friends jealous. Your computer will finally stop saying 'Not Enough Memory'. Server-grade performance without the server-grade noise.",
  image_url: Enum.at(ram_images, 5),
  available: true
})

insert_listing.(%Listing{
  title: "Retro 3GB DDR2 Hideaway - Nostalgia Special",
  memory_type: "DDR2",
  capacity: 3,
  speed: "667 MHz",
  brand: "Kingston",
  price_per_day: Decimal.new("14.99"),
  location: "Philadelphia, PA",
  description: "Take a trip down memory lane with this authentic DDR2 setup. Perfect for that old laptop you can't bear to throw away. Runs Windows Vista like it's 2007 again. Great for playing Minesweeper and Solitaire. May struggle with modern Twitter. Character-building guaranteed.",
  image_url: Enum.at(ram_images, 6),
  available: true
})

insert_listing.(%Listing{
  title: "Stunning 72GB DDR4 Sanctuary - Professional Power",
  memory_type: "DDR4",
  capacity: 72,
  speed: "3200 MHz",
  brand: "Crucial",
  price_per_day: Decimal.new("279.99"),
  location: "Atlanta, GA",
  description: "Serious 4x18GB configuration for serious professionals. Video editors, 3D artists, and data scientists rejoice! Large enough for real work, not so large your wallet cries. Handles multiple Adobe apps simultaneously without breaking a sweat. The sweet spot between enthusiast and enterprise.",
  image_url: Enum.at(ram_images, 7),
  available: true
})

insert_listing.(%Listing{
  title: "Legendary 1TB DDR5 Fortress - The Final Boss",
  memory_type: "DDR5",
  capacity: 1024,
  speed: "5200 MHz",
  brand: "Kingston",
  price_per_day: Decimal.new("3999.99"),
  location: "San Francisco, CA",
  description: "Yes, you read that right. 1 TERABYTE of RAM. 32x32GB DDR5 monstrosity that shouldn't exist but does. Load entire operating systems into RAM disk. Run Minecraft server, GTA V server, and everything else simultaneously. Your power bill will need its own mortgage. Requires liquid nitrogen cooling and questionable life choices.",
  image_url: Enum.at(ram_images, 0),
  available: true
})

insert_listing.(%Listing{
  title: "Scenic 24GB LPDDR5 Capsule - Remote Work Ready",
  memory_type: "LPDDR5",
  capacity: 24,
  speed: "6400 MHz",
  brand: "Micron",
  price_per_day: Decimal.new("129.99"),
  location: "Santa Fe, NM",
  description: "Featherweight LPDDR5 kit tuned for travel ultrabooks. Runs whisper-quiet, barely sips power, and still handles Figma, Zoom, and all-day Spotify sessions. Comes pre-configured for focus sprints and includes a loaner USB-C dock.",
  image_url: "https://images.unsplash.com/photo-1518770660439-4636190af475?w=800",
  available: true
})

insert_listing.(%Listing{
  title: "Industrial 80GB DDR5 Studio - Post Production Hub",
  memory_type: "DDR5",
  capacity: 80,
  speed: "6000 MHz",
  brand: "TeamGroup",
  price_per_day: Decimal.new("319.99"),
  location: "Brooklyn, NY",
  description: "Purpose-built quad channel kit for editors who keep After Effects, DaVinci, and a dozen proxies open at once. Rigorously burn-in tested so render queues can run overnight without drama.",
  image_url: "https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=800",
  available: true
})

insert_listing.(%Listing{
  title: "Vintage 12GB DDR3 Capsule - Maker's Nook",
  memory_type: "DDR3",
  capacity: 12,
  speed: "1600 MHz",
  brand: "Patriot",
  price_per_day: Decimal.new("39.99"),
  location: "Boulder, CO",
  description: "Charming 8GB + 4GB triple-channel throwback for hobby builds, retro LAN parties, or flashing firmware on that stack of routers. Includes complimentary anti-static wrist strap.",
  image_url: "https://images.unsplash.com/photo-1517430816045-df4b7de11d1d?w=800",
  available: false
})

insert_listing.(%Listing{
  title: "Overclocked 48GB DDR5 Lounge - Benchmark Bay",
  memory_type: "DDR5",
  capacity: 48,
  speed: "6800 MHz",
  brand: "ADATA",
  price_per_day: Decimal.new("219.99"),
  location: "Las Vegas, NV",
  description: "Hand-binned sticks mounted with active cooling for leaderboard chasers. Pushes extreme XMP profiles while keeping RGB accents tasteful. LN2 pot not included but highly encouraged.",
  image_url: "https://images.unsplash.com/photo-1461749280684-dccba630e2f6?w=800",
  available: true
})

insert_listing.(%Listing{
  title: "Quiet 64GB DDR4 Library - Focused Flex Space",
  memory_type: "DDR4",
  capacity: 64,
  speed: "3600 MHz",
  brand: "HyperX",
  price_per_day: Decimal.new("189.99"),
  location: "Madison, WI",
  description: "Low-profile DDR4 kit with zero lighting and tuned timings for deep work. Perfect for research sprints, data exploration, and serious note-taking without disco vibes.",
  image_url: "https://images.unsplash.com/photo-1518779578993-ec3579fee39f?w=800",
  available: true
})

insert_listing.(%Listing{
  title: "Eco 48GB DDR4 Camper - Solar Powered Bandwidth",
  memory_type: "DDR4",
  capacity: 48,
  speed: "3000 MHz",
  brand: "Patriot",
  price_per_day: Decimal.new("109.99"),
  location: "Bend, OR",
  description: "Ultra-efficient 2x24GB kit mounted in a fanless shell with solar-ready power delivery. Designed for off-grid coders who want silent builds while camping in the Cascades.",
  image_url: "https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=800",
  available: true
})

insert_listing.(%Listing{
  title: "Nomadic 64GB LPDDR5X Pod - Remote Studio",
  memory_type: "LPDDR5X",
  capacity: 64,
  speed: "7500 MHz",
  brand: "Samsung",
  price_per_day: Decimal.new("199.99"),
  location: "Lisbon, Portugal",
  description: "Travel-friendly low-power module tuned for ultrabooks. Comes pre-configured with a virtual coworking pass, VPN, and focus music playlist. Runs cool even on rooftop terraces.",
  image_url: "https://images.unsplash.com/photo-1545239351-1141bd82e8a6?w=800",
  available: true
})

insert_listing.(%Listing{
  title: "Titan 768GB DDR5 Bunker - AI Playground",
  memory_type: "DDR5",
  capacity: 768,
  speed: "5200 MHz",
  brand: "Micron",
  price_per_day: Decimal.new("1299.99"),
  location: "Zurich, Switzerland",
  description: "12-channel monster built for ML researchers. Includes Kubernetes templates, liquid cooling, and an on-call SRE. Enough memory to fit entire language models with room for logs.",
  image_url: "https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?w=800",
  available: true
})

insert_listing.(%Listing{
  title: "Cozy 16GB DDR4 Tiny House - Study Buddy",
  memory_type: "DDR4",
  capacity: 16,
  speed: "3200 MHz",
  brand: "PNY",
  price_per_day: Decimal.new("44.99"),
  location: "Ann Arbor, MI",
  description: "Adorable low-profile sticks with built-in timers to remind you to hydrate between study sessions. Perfect for students cramming render-heavy projects the night before critique.",
  image_url: "https://images.unsplash.com/photo-1520607162513-77705c0f0d4a?w=800",
  available: false
})

IO.puts("Seeded #{Repo.aggregate(Listing, :count, :id)} RAM listings!")
