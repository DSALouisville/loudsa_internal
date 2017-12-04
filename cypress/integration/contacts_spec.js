describe('Contacts Page', () => {
  beforEach(() => {
    cy.visit('http://localhost:4000/contacts');
  });
  it('has the correct title', () => {
    cy.title().should('include', 'Louisville DSA - Contacts')
  });
  it('has a top level heading', () => {
    cy.get('h1').should('contain', 'Contacts')
  });
});
