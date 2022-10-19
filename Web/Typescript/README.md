# Typescript Challenge (Medium) <!-- omit in toc -->

- [Introduction](#introduction)
- [Problem Statement](#problem-statement)
  - [Example](#example)
- [Requirements](#requirements)
- [Expectations](#expectations)

## Introduction

As a software engineer within **DevFest Inc.**, you have to provide reliable web applications to clients while also helping other team members in their quest to craft the best web app.

Your task today is to implement a typescript utility for your teammates to help them in their day to day coding journey with Typescript.

## Problem Statement

The web is quickly evolving and most of companies are switching their projects from plain **Javascript** to **Typescript** to benefit from the typesafety that Typescript provides and help improve projects' maintainability while avoiding potential bugs.

At **DevFest Inc** we are also hyped by **Typescript** and we have decided to **migrate** our codebase to use **Typescript**.
But first we want to have a set of Typescript primitives & utilities to help the dev team in the migration process.

As a frontend engineer **Your Mission, Should You Choose To Accept It** 💻 is to build a typescript utility that takes an object type as an argument and reverse the value of each property. we would like to name this generic: `ReverseObjectValues`.

And as the great poet.... once said:

> there's no better explanation then an example

### Example

```typescript
type Person = {
  firstName: "John";
  lastName: "Doe";
};
type Result1 = ReverseObjectValues<Person>;
// expected: { firstName: "nhoj"; lastName: "eoD";}
type Result2 = ReverseObjectValues<Result1>;
// expected: { firstName: "John"; lastName: "Doe";}
```

## Requirements

1. Solution must be written in Typescript.
2. Solution must only use **Built-in Typescript Functions**
3. Solution must work and tests should all pass.
4. Solution must use the provided boilerplate code.

## Expectations

- This challenge should take around **1** to **2** hours to complete based on Typescript knowledge.
- We value a **clean**, **simple** working solution.

## Setup

To get you started with this challenge, we have provided you with a starting point. so you need first to copy to your local environment the `starter` folder you see next to this challenge. and install all the dependencies:

```bash
cd starter-folder
npm install
```

**[⬆ back to top](#introduction)**
