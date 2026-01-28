document.addEventListener('DOMContentLoaded', function() {
    console.log('DOM carregado, inicializando scripts...');

//Init - Formulário de contato
    if (document.getElementById('contactForm')) {
        initContactForm();
    }
    
//Hover - Cards de classes
    if (document.querySelector('.class-card')) {
        initClassCards();
    }
});


function initContactForm() {
    const contactForm = document.getElementById('contactForm');
    
    contactForm.addEventListener('submit', function(event) {
        event.preventDefault();
        
        const name = document.getElementById('name');
        const email = document.getElementById('email');
        const subject = document.getElementById('subject');
        const message = document.getElementById('message');
        const character = document.getElementById('character');
        const server = document.getElementById('server');
        const newsletter = document.getElementById('newsletter');
        
        let isValid = true;
        if (!name.value.trim()) {
            name.classList.add('is-invalid');
            isValid = false;
        } else {
            name.classList.remove('is-invalid');
            name.classList.add('is-valid');
        }
        
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!email.value.trim() || !emailRegex.test(email.value.trim())) {
            email.classList.add('is-invalid');
            isValid = false;
        } else {
            email.classList.remove('is-invalid');
            email.classList.add('is-valid');
        }
        
        if (!subject.value.trim()) {
            subject.classList.add('is-invalid');
            isValid = false;
        } else {
            subject.classList.remove('is-invalid');
            subject.classList.add('is-valid');
        }
        
        if (!message.value.trim()) {
            message.classList.add('is-invalid');
            isValid = false;
        } else {
            message.classList.remove('is-invalid');
            message.classList.add('is-valid');
        }
        
        if (isValid) {
            const formData = {
                nome: name.value.trim(),
                email: email.value.trim(),
                personagem: character.value.trim() || 'Não informado',
                servidor: server.value ? server.options[server.selectedIndex].text : 'Não informado',
                assunto: subject.value.trim(),
                mensagem: message.value.trim(),
                newsletter: newsletter.checked ? 'Sim' : 'Não'
            };

            Swal.fire({
                title: 'Mensagem Enviada!',
                html: `
                    <div class="text-start">
                        <p><strong>Nome:</strong> ${formData.nome}</p>
                        <p><strong>Email:</strong> ${formData.email}</p>
                        <p><strong>Personagem:</strong> ${formData.personagem}</p>
                        <p><strong>Servidor:</strong> ${formData.servidor}</p>
                        <p><strong>Assunto:</strong> ${formData.assunto}</p>
                        <p><strong>Receber novidades:</strong> ${formData.newsletter}</p>
                    </div>
                `,
                icon: 'success',
                confirmButtonText: 'Fechar',
                confirmButtonColor: '#6a1b9a',
                background: '#f5f0ff',
                customClass: {
                    title: 'text-purple',
                    htmlContainer: 'swal-content'
                }
            }).then(() => {
                contactForm.reset();
                
                const formElements = contactForm.elements;
                for (let i = 0; i < formElements.length; i++) {
                    formElements[i].classList.remove('is-valid');
                }
            });
        } else {
            Swal.fire({
                title: 'Atenção!',
                text: 'Por favor, preencha todos os campos obrigatórios corretamente.',
                icon: 'error',
                confirmButtonText: 'Entendi',
                confirmButtonColor: '#6a1b9a',
                background: '#f5f0ff'
            });
        }
    });
    
    const formInputs = contactForm.querySelectorAll('input, textarea, select');
    formInputs.forEach(input => {
        input.addEventListener('blur', function() {
            if (this.hasAttribute('required')) {
                if (!this.value.trim()) {
                    this.classList.add('is-invalid');
                    this.classList.remove('is-valid');
                } else {
                    if (this.type === 'email') {
                        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                        if (!emailRegex.test(this.value.trim())) {
                            this.classList.add('is-invalid');
                            this.classList.remove('is-valid');
                        } else {
                            this.classList.remove('is-invalid');
                            this.classList.add('is-valid');
                        }
                    } else {
                        this.classList.remove('is-invalid');
                        this.classList.add('is-valid');
                    }
                }
            }
        });
    });
}

//Hover - Cards de classes
function initClassCards() {
    const classCards = document.querySelectorAll('.class-card');
    
    classCards.forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.classList.add('class-card-hover');
        });
        card.addEventListener('mouseleave', function() {
            this.classList.remove('class-card-hover');
        });
    });
}