import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy();
  runApp(GustuWebStudio());
}

class GustuWebStudio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gustu Web Studio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Roboto',
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  // 📱 WA: 087896925026
  Future<void> _launchWhatsApp() async {
    const url = 'https://wa.me/6287896925026';
    launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  Future<void> _launchCall() async {
    launchUrl(Uri.parse('tel:6287896925026'));
  }

  Future<void> _launchEmail() async {
    launchUrl(Uri.parse('mailto:hello@gustuweb.com'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      body: Column(
        children: [
          // 🏠 NAVBAR
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
            ),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Color(0xFFFF6B35),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(Icons.web, color: Colors.white, size: 28),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'GUSTU WEB STUDIO',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF6B35),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      NavButton(label: 'Home', index: 0),
                      NavButton(label: 'Portofolio', index: 1),
                      NavButton(label: 'Harga', index: 2),
                      NavButton(label: 'Kontak', index: 3),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: _launchWhatsApp,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF6B35),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        ),
                        child: Text('PESAN SEKARANG'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // 📱 CONTENT PAGES
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              children: [
                // 🏠 HOME
                HomeSection(),
                // 🎨 PORTFOLIO
                PortfolioSection(),
                // 💰 PRICE LIST
                PriceListSection(onWhatsApp: _launchWhatsApp),
                // 📞 CONTACT
                ContactSection(
                  onWhatsApp: _launchWhatsApp,
                  onCall: _launchCall,
                  onEmail: _launchEmail,
                ),
              ],
            ),
          ),

          // 📍 FOOTER
          Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Color(0xFFFF6B35),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'GUSTU WEB STUDIO',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '0878-9692-5026 | hello@gustuweb.com',
                  style: TextStyle(color: Colors.white70),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _launchWhatsApp,
                      icon: Icon(Icons.message, color: Colors.white, size: 30),
                      tooltip: 'WhatsApp',
                    ),
                    IconButton(
                      onPressed: _launchCall,
                      icon: Icon(Icons.phone, color: Colors.white, size: 30),
                      tooltip: 'Call',
                    ),
                    IconButton(
                      onPressed: _launchEmail,
                      icon: Icon(Icons.email, color: Colors.white, size: 30),
                      tooltip: 'Email',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 🏠 HOME SECTION
class HomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Hero Banner
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFF6B35),
                  Color(0xFFF7931E),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'JASA PEMBUATAN',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'WEBSITE PROFESIONAL',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    'Landing Page • Company Profile • Toko Online • Custom Website\nResponsive • SEO Friendly • Cepat • Murah',
                    style: TextStyle(fontSize: 20, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {}, // Scroll to price
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xFFFF6B35),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text(
                    'LIHAT HARGA',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),

          // Services
          Padding(
            padding: EdgeInsets.all(60),
            child: Column(
              children: [
                Text(
                  'LAYANAN KAMI',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 60),
                Row(
                  children: [
                    Expanded(child: ServiceCard(title: 'Landing Page', subtitle: 'Rp500rb', icon: Icons.web, color: Colors.green)),
                    SizedBox(width: 30),
                    Expanded(child: ServiceCard(title: 'Company Profile', subtitle: 'Rp1.5jt', icon: Icons.business, color: Colors.blue)),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(child: ServiceCard(title: 'Toko Online', subtitle: 'Rp3jt', icon: Icons.shopping_cart, color: Colors.purple)),
                    SizedBox(width: 30),
                    Expanded(child: ServiceCard(title: 'Custom Premium', subtitle: 'Rp5jt+', icon: Icons.star, color: Color(0xFFFF6B35))),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 🎨 PORTFOLIO SECTION
class PortfolioSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(60),
        child: Column(
          children: [
            Text(
              'PORTFOLIO KAMI',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 60),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              childAspectRatio: 1.5,
              children: List.generate(6, (index) => PortfolioCard()),
            ),
          ],
        ),
      ),
    );
  }
}

// 💰 PRICE LIST SECTION
class PriceListSection extends StatelessWidget {
  final VoidCallback onWhatsApp;

  const PriceListSection({Key? key, required this.onWhatsApp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(60),
        child: Column(
          children: [
            Text(
              'PRICE LIST LENGKAP',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 60),
            Row(
              children: [
                Expanded(child: PriceCardWeb(title: 'Landing Page', price: 'Rp500.000', features: ['1 halaman', 'Responsive', 'WhatsApp', 'Modern'])),
                SizedBox(width: 40),
                Expanded(child: PriceCardWeb(title: 'Company Profile', price: 'Rp1.500.000', features: ['Home', 'Tentang', 'Layanan', 'Galeri', 'Kontak'], isPopular: true)),
              ],
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Expanded(child: PriceCardWeb(title: 'Toko Online', price: 'Rp3.000.000', features: ['Catalog Produk', 'Checkout WA', 'Responsive', 'SEO'])),
                SizedBox(width: 40),
                Expanded(child: PriceCardWeb(title: 'Premium Custom', price: 'Rp5.000.000', features: ['Custom Design', 'Animasi', 'Booking', 'Admin', 'SEO Pro'])),
              ],
            ),
            SizedBox(height: 60),
            ElevatedButton(
              onPressed: onWhatsApp,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF6B35),
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 25),
              ),
              child: Text('ORDER SEKARANG 0878-9692-5026', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

// 📞 CONTACT SECTION
class ContactSection extends StatelessWidget {
  final VoidCallback onWhatsApp, onCall, onEmail;

  const ContactSection({
    Key? key,
    required this.onWhatsApp,
    required this.onCall,
    required this.onEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(60),
        child: Column(
          children: [
            Text(
              'HUBUNGI KAMI',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 60),
            Row(
              children: [
                Expanded(child: ContactCard(title: 'WhatsApp', subtitle: '0878-9692-5026', icon: Icons.message, onTap: onWhatsApp)),
                SizedBox(width: 40),
                Expanded(child: ContactCard(title: 'Telepon', subtitle: '0878-9692-5026', icon: Icons.phone, onTap: onCall)),
              ],
            ),
            SizedBox(height: 40),
            Expanded(child: ContactCard(title: 'Email', subtitle: 'hello@gustuweb.com', icon: Icons.email, onTap: onEmail)),
          ],
        ),
      ),
    );
  }
}

// 🔧 WIDGET COMPONENTS
class NavButton extends StatelessWidget {
  final String label;
  final int index;

  const NavButton({Key? key, required this.label, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(label, style: TextStyle(fontSize: 18, color: Colors.grey[700])),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  final Color color;

  const ServiceCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: color, size: 50),
          ),
          SizedBox(height: 20),
          Text(title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text(subtitle, style: TextStyle(fontSize: 18, color: Colors.grey[600])),
        ],
      ),
    );
  }
}

class PortfolioCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)],
      ),
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              image: DecorationImage(
                image: NetworkImage('https://picsum.photos/300/150?random=${DateTime.now().millisecond}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text('Website Client', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text('Jakarta, 2024', style: TextStyle(color: Colors.grey[600])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PriceCardWeb extends StatelessWidget {
  final String title, price;
  final List<String> features;
  final bool isPopular;

  const PriceCardWeb({
    Key? key,
    required this.title,
    required this.price,
    required this.features,
    this.isPopular = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)],
        border: isPopular ? Border.all(color: Color(0xFFFF6B35), width: 4) : null,
      ),
      child: Column(
        children: [
          if (isPopular)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xFFFF6B35),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text('⭐ TERPOPULER', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          SizedBox(height: 20),
          Text(title, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          SizedBox(height: 15),
          Text(price, style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900, color: Color(0xFFFF6B35))),
          SizedBox(height: 30),
          ...features.map((f) => Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(children: [Icon(Icons.check, color: Colors.green), SizedBox(width: 15), Text(f)]),
          )),
        ],
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const ContactCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Color(0xFFFF6B35).withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(icon, color: Color(0xFFFF6B35), size: 40),
            ),
            SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text(subtitle, style: TextStyle(fontSize: 18, color: Colors.grey[600])),
              ],
            ),
          ],
        ),
      ),
    );
  }
}