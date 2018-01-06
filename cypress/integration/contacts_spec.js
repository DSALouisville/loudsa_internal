import randomstring from 'randomstring';

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

    // Visit the create contact page via link on index page
    cy.get('a').should('contain', 'Create');
    cy.get('a').contains('Create').click();
    cy.url().should('contain', 'contacts/create');
    cy.get('h1').should('contain', 'Create');

    // Create contact page should display a form
    cy.get('label').should('contain', 'Name')
    cy.get('label').should('contain', 'Email')
    cy.get('button').should('contain', 'Submit')

    // Add a contact with the form
    const name ="name__"; //randomstring.generate(7);
    cy.get('input[name="contact[name]"]').type(name);
    cy.get('input[name="contact[email]"]').type("fake@email.com");
    cy.get('input[name="contact[phone]"]').type("(502)345-2345");
    cy.get('button').click();
    cy.url().should('eq', 'http://localhost:4000/contacts');
    cy.get('li').should('contain', name)
  });

  it('validations on inputs', () => {
    cy.visit('http://localhost:4000/contacts/create');
    cy.get('input[name="contact[name]"]').type('carg')
    cy.get('input[name="contact[email]"]').type("fake@email.com");
    cy.get('input[name="contact[phone]"]').type("(502)345-2345");
    cy.get('button').click();
    cy.get('.alert-danger').should('contain', 'name')
    cy.get('.alert-danger').should('contain', 'least')
  });

  it('deletes contacts', () => {
    cy.visit('http://localhost:4000/contacts');
    cy.get('li').contains("name__").siblings('.delete').click();
  });

  it('view/edit contact', () => {
    cy.visit('http://localhost:4000/contact/1');
    cy.get('.show-field-label').should('contain', 'Name')
    cy.get('.show-field-label').should('contain', 'Phone')
    cy.get('.show-field-label').should('contain', 'Email')
  });
});
