const express = require('express');
const app = express();
const port = 3000;

const data = {
    categories: [
        {
            id: "fiction",
            name: "Fiction",
            books: [
                {
                    id: "book3",
                    title: "1984",
                    author: "George Orwell"
                },
                {
                    id: "book1",
                    title: "The Great Gatsby",
                    author: "F. Scott Fitzgerald"
                },
                {
                    id: "book2",
                    title: "To Kill a Mockingbird",
                    author: "Harper Lee"
                },

                {
                    id: "book4",
                    title: "Pride and Prejudice",
                    author: "Jane Austen"
                }
            ]
        },
        {
            id: "non-fiction",
            name: "Non-Fiction",
            books: [
                {
                    id: "book5",
                    title: "A Brief History of Time",
                    author: "Stephen Hawking"
                },
                {
                    id: "book6",
                    title: "The Immortal Life of Henrietta Lacks",
                    author: "Rebecca Skloot"
                },
                {
                    id: "book7",
                    title: "Sapiens: A Brief History of Humankind",
                    author: "Yuval Noah Harari"
                },
                {
                    id: "book8",
                    title: "Educated",
                    author: "Tara Westover"
                }
            ]
        },
        {
            id: "mystery",
            name: "Mystery",
            books: [
                {
                    id: "book9",
                    title: "The Da Vinci Code",
                    author: "Dan Brown"
                },
                {
                    id: "book10",
                    title: "Gone Girl",
                    author: "Gillian Flynn"
                },
                {
                    id: "book11",
                    title: "Sherlock Holmes: The Complete Novels and Stories",
                    author: "Arthur Conan Doyle"
                },
                {
                    id: "book12",
                    title: "The Girl with the Dragon Tattoo",
                    author: "Stieg Larsson"
                }
            ]
        },
        {
            id: "fantasy",
            name: "Fantasy",
            books: [
                {
                    id: "book13",
                    title: "Harry Potter and the Sorcerer's Stone",
                    author: "J.K. Rowling"
                },
                {
                    id: "book14",
                    title: "The Hobbit",
                    author: "J.R.R. Tolkien"
                },
                {
                    id: "book15",
                    title: "A Game of Thrones",
                    author: "George R.R. Martin"
                },
                {
                    id: "book16",
                    title: "The Name of the Wind",
                    author: "Patrick Rothfuss"
                }
            ]
        },
        {
            id: "science-fiction",
            name: "Science Fiction",
            books: [
                {
                    id: "book17",
                    title: "Dune",
                    author: "Frank Herbert"
                },
                {
                    id: "book18",
                    title: "Ender's Game",
                    author: "Orson Scott Card"
                },
                {
                    id: "book19",
                    title: "The Hitchhiker's Guide to the Galaxy",
                    author: "Douglas Adams"
                },
                {
                    id: "book20",
                    title: "The Left Hand of Darkness",
                    author: "Ursula K. Le Guin"
                }
            ]
        },
        {
            id: "biography",
            name: "Biography",
            books: [
                {
                    id: "book21",
                    title: "Steve Jobs",
                    author: "Walter Isaacson"
                },
                {
                    id: "book22",
                    title: "The Diary of a Young Girl",
                    author: "Anne Frank"
                },
                {
                    id: "book23",
                    title: "Becoming",
                    author: "Michelle Obama"
                },
                {
                    id: "book24",
                    title: "Long Walk to Freedom",
                    author: "Nelson Mandela"
                }
            ]
        }
    ]
}

app.get('/api/categories', (req, res) => {
    res.json(data.categories);
});

app.get('/api/categories/:categoryId', (req, res) => {
    const category = data.categories.find(c => c.id === req.params.categoryId);
    if (category) {
        res.json(category);
    } else {
        res.status(404).json({ error: 'Category not found' });
    }
});

app.get('/api/categories/:categoryId/:bookId', (req, res) => {
    const category = data.categories.find(c => c.id === req.params.categoryId);
    if (category) {
        const book = category.books.find(b => b.id === req.params.bookId);
        if (book) {
            res.json(book);
        } else {
            res.status(404).json({ error: 'Book not found' });
        }
    } else {
        res.status(404).json({ error: 'Category not found' });
    }
});

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});