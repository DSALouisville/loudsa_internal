describe('Contacts Page', () => {
  beforeEach(() => {
    cy.visit('http://localhost:4000/contacts');
  });
  it('has a top level heading', () => {
    cy.get('h1').should('contain', 'Contacts')
  });
});
