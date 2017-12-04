describe('Contacts Page', () => {
  beforeEach(() => {
    cy.visit('http://localhost:4000/contacts');
  });
  it('has a top level heading', () => {
    cy.get('h1').should('contain', 'Contacts')
  });
  it('shows contacts', () => {
    cy.get('.contacts-list li .contact-name').should('contain', 'Bilbo Baggins')
    cy.get('.contacts-list li .contact-email').should('contain', 'bilbo@shire.com')
    cy.get('.contacts-list li .contact-name').should('contain', 'Frodo Baggins')
    cy.get('.contacts-list li .contact-email').should('contain', 'frodo@shire.com')
  });
  it('links to contact show page', () => {

  });
});
