describe('Header', () => {

  beforeEach(() => {
    cy.visit('http://localhost:4000');
  });

  it('has a join dsa link', () => {
    cy.get('header')
      .children('nav')
      .children('ul')
      .should('contain', 'Join DSA')
      .click()
    cy.url().should('contain', 'act.dsausa.org');
  });
});
