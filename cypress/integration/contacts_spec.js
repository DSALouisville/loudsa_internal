describe('Contacts', () => {
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
  it('has a single contact view', () => {
    cy.visit('http://localhost:4000/contact/1')
    cy.get('h1').should('contain', 'Bilbo');
  });
  it('links to contact show page', () => {
    cy.get('li').contains('Bilbo').click()
    cy.url().should('contain', 'contact/')
    cy.url().should('contain', '1')
  });
  it('has a create contact page', () => {
    cy.get('a').should('contain', 'Create');
    cy.get('a').contains('Create').click();
    cy.url().should('contain', 'contacts/create');
    cy.get('h1').should('contain', 'Create');
    cy.get('label').should('contain', 'Name')
    cy.get('label').should('contain', 'Email')
    cy.get('button').should('contain', 'Submit')
  });
});
