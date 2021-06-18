# Angular Unit Testing
Framework _Jasmine_

```bash
ng test
```
lanza _Karma_

## Archivos de testing
``name.component.spec.ts``
``name.service.spec.ts``

```ts
it('should render title in a h1 tag', () => {
    const fixture = TestBed.createComponent(AppComponent);
    fixture.detectChanges();
    const compiled = fixture.debugElement.nativeElement;
    expect(compiled.querySelector('h1').textContent)
        .toContain('Welcome to angular6app-test!');
});
```
## Probar servicios


## Integracion continuea (CI)
Continuous integration (CI) servers let you set up your project repository so that your tests run on every _commit_ and _pull request_.
