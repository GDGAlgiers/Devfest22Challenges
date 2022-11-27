import { Equal, Expect } from "../helpers/type-utils";

/* _____________ Code goes here _____________ */
type ReverseObjectValues = never;

/* _____________ Test Cases _____________ */
type Person = {
  firstName: "John";
  lastName: "Doe";
};

type Expected = {
  firstName: "nhoJ";
  lastName: "eoD";
};

type InvalidPerson = { firstName: () => {} };

type cases = [
  Expect<Equal<ReverseObjectValues<Person>, Expected>>,
  Expect<Equal<ReverseObjectValues<Expected>, Person>>,
  // @ts-expect-error
  ReverseObjectValues<InvalidPerson>
];
