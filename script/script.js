document.addEventListener("DOMContentLoaded", function () {
    const menuLinks = document.querySelectorAll("#menu a");
    
    menuLinks.forEach(link => {
        link.addEventListener("click", function (event) {
            event.preventDefault(); 
            const targetId = this.getAttribute("href");
            const targetSection = document.querySelector(targetId); 
            
            
            if (targetSection) {
                const headerOffset = document.querySelector("header").offsetHeight; 
                const elementPosition = targetSection.getBoundingClientRect().top; 
                const offsetPosition = elementPosition + window.scrollY - headerOffset;
                
               
                window.scrollTo({
                    top: offsetPosition,
                    behavior: "smooth"
                });
            }
        });
    });
});

document.addEventListener('DOMContentLoaded', function () {
    const whatsappButton = document.querySelector('.btn-whatsapp');
  
    
    const phoneNumber = '5511964870847'; 
    const message = 'Olá, gostaria de esclarecer algumas dúvidas!'; 
  
 
    whatsappButton.addEventListener('click', function (event) {
      event.preventDefault(); 
  
     
      const whatsappURL = `https://api.whatsapp.com/send?phone=${phoneNumber}&text=${encodeURIComponent(message)}`;
      
      window.open(whatsappURL, '_blank');
    });
  });
  

AOS.init();
