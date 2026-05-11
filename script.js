// ========================================
// NAILS CORNER GIANYAR - WA 087896925026
// SCRIPT 100% FIX - COPY SELURUH
// ========================================

// WA NUMBER 087896925026
const WA_NUMBER = '6287896925026';

console.log('✅ Script loaded - WA:', WA_NUMBER); // TEST DI CONSOLE

// Navbar Mobile
document.addEventListener('DOMContentLoaded', function() {
    const hamburger = document.querySelector('.hamburger');
    const navMenu = document.querySelector('.nav-menu');
    
    if (hamburger && navMenu) {
        hamburger.addEventListener('click', () => {
            hamburger.classList.toggle('active');
            navMenu.classList.toggle('active');
        });
        
        document.querySelectorAll('.nav-menu a').forEach(link => {
            link.addEventListener('click', () => {
                hamburger.classList.remove('active');
                navMenu.classList.remove('active');
            });
        });
    }
});

// Smooth scroll
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        target?.scrollIntoView({ behavior: 'smooth', block: 'start' });
    });
});

// FORM BOOKING - WA 087896925026
const formBooking = document.querySelector('.booking-form');
if (formBooking) {
    formBooking.addEventListener('submit', function(e) {
        e.preventDefault();
        console.log('📝 Form submitted'); // TEST
        
        const nama = this.querySelector('input[type="text"]').value;
        const waPelanggan = this.querySelector('input[type="tel"]').value;
        const layanan = this.querySelector('select').value;
        const tanggal = this.querySelector('input[type="date"]').value;
        const catatan = this.querySelector('textarea').value || 'Tidak ada';
        
        // PESAN WA
        const pesan = `✨ *RESERVASI NAILS CORNER* ✨

👤 *Nama:* ${nama}
📱 *WA:* ${waPelanggan}
💅 *Layanan:* ${layanan}
📅 *Tanggal:* ${tanggal}
📝 *Catatan:* ${catatan}

*Mohon konfirmasi ya Kak!* 💖`;

        // LINK WA 087896925026
        const urlWA = `https://wa.me/${WA_NUMBER}?text=${encodeURIComponent(pesan)}`;
        console.log('📱 WA URL:', urlWA); // TEST
        
        // ANIMASI
        const btn = this.querySelector('button');
        const textAsli = btn.innerHTML;
        btn.innerHTML = '✅ BERHASIL!';
        btn.style.background = '#10b981';
        btn.disabled = true;
        
        setTimeout(() => {
            btn.innerHTML = textAsli;
            btn.style.background = '';
            btn.disabled = false;
            this.reset();
            
            // BUKA WA
            window.open(urlWA, '_blank');
            
            // ALERT FIX
            alert(`🎉 *BOOKING SUKSES!*\n\n📱 WA: *0878-9692-5026*\n\nWhatsApp otomatis terbuka! 💬`);
        }, 1200);
    });
}

// Floating WA Button
const waBtn = document.createElement('a');
waBtn.href = `https://wa.me/${WA_NUMBER}`;
waBtn.innerHTML = '<i class="fab fa-whatsapp"></i>';
waBtn.target = '_blank';
waBtn.style.cssText = `
    position:fixed;bottom:25px;right:25px;
    width:65px;height:65px;background:#25D366;
    border-radius:50%;display:flex;align-items:center;
    justify-content:center;font-size:2rem;color:white;
    box-shadow:0 8px 30px rgba(37,211,102,0.5);
    z-index:9999;text-decoration:none;transition:all .3s;
    animation:pulse 2s infinite;
`;
document.body.appendChild(waBtn);

waBtn.addEventListener('click', () => {
    console.log('🟢 WA Button clicked - 087896925026');
});

// Gallery
document.querySelectorAll('.gallery-item').forEach(item => {
    item.addEventListener('click', function() {
        const img = this.querySelector('img').src;
        const modal = document.createElement('div');
        modal.style.cssText = 'position:fixed;top:0;left:0;width:100%;height:100%;background:rgba(0,0,0,0.9);display:flex;align-items:center;justify-content:center;z-index:9998;cursor:pointer';
        modal.innerHTML = `<img src="${img}" style="max-width:90%;max-height:90%;border-radius:10px;">`;
        document.body.appendChild(modal);
        modal.onclick = () => document.body.removeChild(modal);
    });
});

// TEST CONSOLE - Buka F12 > Console
console.log('🔥 Nails Corner Script Loaded!');
console.log('📱 WA Number:', '0878-9692-5026');
console.log('✅ Ready to receive bookings!');
